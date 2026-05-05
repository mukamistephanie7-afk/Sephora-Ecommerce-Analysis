CREATE DATABASE sephora_analysis;
USE sephora_analysis;
SELECT * FROM sephora_clean
LIMIT 10;
-- ================================================
-- SEPHORA E-COMMERCE PRODUCT PERFORMANCE ANALYSIS
-- Analyst: Stephanie Mukami Gitonga
-- Tool: MySQL
-- Date: April 2026
-- ================================================

-- SECTION A: WHAT IS PERFORMING WELL AND WHY?

-- ------------------------------------------------
-- QUESTION 1: Which product categories have the 
-- highest average ratings?
-- Purpose: Identifies which areas of the catalogue  
-- customers are most satisfied with
-- ------------------------------------------------

SELECT 
    primary_category,
    ROUND(AVG(rating), 2) AS avg_rating,
    COUNT(product_id) AS total_products
FROM sephora_clean
WHERE rating > 0
GROUP BY primary_category
ORDER BY avg_rating DESC;

-- FINDING: Makeup leads with 4.52 average rating, followed by Skincare at 4.30. Bath & Body is the 
-- lowest performing category at 4.00
-- ------------------------------------------------

-- ------------------------------------------------
-- QUESTION 2: Which brands are driving the most customer engagement (loves count)?
-- Purpose: Loves count reflects how many customers have saved or favourited a product which is a strong signal of brand loyalty and popularity
-- ------------------------------------------------

SELECT 
    brand_name,
    SUM(loves_count) AS total_loves,
    COUNT(product_id) AS total_products,
    ROUND(AVG(loves_count)) AS avg_loves_per_product
FROM sephora_clean
GROUP BY brand_name
ORDER BY total_loves DESC
LIMIT 10;

-- FINDING: [ Anastasia Beverly Hills dominates customer engagement with 4.1M total loves from just 9 products,
-- averaging 460,089 loves per product thus indicating an exceptionally loyal customer base despite a small catalogue]
-- ------------------------------------------------

-- ------------------------------------------------
-- QUESTION 3: What is the ideal price range that produces the highest rated products?
-- Purpose: Determines whether pricing is a driver of customer satisfaction and do customers feel they get value for money?
-- ------------------------------------------------

SELECT 
    CASE 
        WHEN price_usd BETWEEN 0 AND 25 THEN 'Budget ($0-$25)'
        WHEN price_usd BETWEEN 26 AND 50 THEN 'Mid Range ($26-$50)'
        WHEN price_usd BETWEEN 51 AND 100 THEN 'Premium ($51-$100)'
        WHEN price_usd BETWEEN 101 AND 300 THEN 'Luxury ($101-$300)'
        ELSE 'Ultra Luxury ($300+)'
    END AS price_range,
    ROUND(AVG(rating), 2) AS avg_rating,
    COUNT(product_id) AS total_products
FROM sephora_clean
WHERE rating > 0
GROUP BY price_range
ORDER BY avg_rating DESC;

-- FINDING: [Budget products ($0-$25) have the highest  avg rating of 4.25 while Luxury ($101-$300) is lowest at 4.10.
-- However the difference is minimal suggesting that price alone does not significantly drive customer  
-- satisfaction as product quality matters more than price point]
-- ------------------------------------------------


-- ------------------------------------------------
-- QUESTION 4: Do Sephora exclusive products perform  better than non exclusive ones?
-- Purpose: Tests whether exclusivity drives stronger ratings and engagement which is a key insight for product sourcing strategy
-- ------------------------------------------------

SELECT 
    CASE 
        WHEN sephora_exclusive = 1 THEN 'Sephora Exclusive'
        ELSE 'Non Exclusive'
    END AS exclusivity,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(loves_count)) AS avg_loves,
    COUNT(product_id) AS total_products
FROM sephora_clean
WHERE rating > 0
GROUP BY sephora_exclusive
ORDER BY avg_rating DESC;

-- FINDING: [Sephora Exclusive products outperform Non Exclusive ones with an avg rating of 4.37 vs 4.16  
-- and avg loves of 11,153 vs 30,385.
-- While exclusives are rated higher, non exclusive products have higher total loves which is likely due 
-- to having more products (199) compared to exclusives (47)]
-- ------------------------------------------------


-- ------------------------------------------------
-- QUESTION 5: Which individual products are the top performers overall?
-- Purpose: Identifies standout products based on a combination of rating, loves count and reviews
-- ------------------------------------------------

SELECT 
    product_name,
    brand_name,
    primary_category,
    price_usd,
    rating,
    loves_count,
    reviews
FROM sephora_clean
WHERE rating > 0
ORDER BY loves_count DESC, rating DESC
LIMIT 10;

-- FINDING: [Anastasia Beverly Hills dominates the top 10 most loved products, occupying nearly all top spots.  
-- The Brow Wiz Ultra Slim Precision Brow Pencil leads with 834,189 loves at just $25 — confirming that affordable  
-- high quality products drive the strongest engagement]
-- ------------------------------------------------

-- ================================================
-- SECTION B: WHAT IS UNDERPERFORMING AND WHY?
-- ================================================


-- ------------------------------------------------
-- QUESTION 6: Which categories have the lowest ratings and least engagement?
-- Purpose: Pinpoints problem areas in the catalogue that need strategic attention
-- ------------------------------------------------

SELECT 
    primary_category,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(loves_count)) AS avg_loves,
    COUNT(product_id) AS total_products,
    SUM(CASE WHEN out_of_stock = 1 THEN 1 ELSE 0 END) AS out_of_stock_count
FROM sephora_clean
WHERE rating > 0
GROUP BY primary_category
ORDER BY avg_rating ASC, avg_loves ASC;

-- FINDING: [Bath & Body is the weakest category with the lowest avg rating of 4.0 and lowest avg loves of  6,680.
--  Makeup dominates with avg loves of 221,840 which is 33x higher than Bath & Body showing a massive engagement gap]
-- ------------------------------------------------


-- ------------------------------------------------
-- QUESTION 7: Which products are overpriced relative to their rating?
-- Purpose: Highlights products where price does not reflect customer experience.
-- ------------------------------------------------

SELECT 
    product_name,
    brand_name,
    primary_category,
    price_usd,
    rating,
    loves_count,
    reviews
FROM sephora_clean
WHERE rating > 0
AND rating < 3.5
AND price_usd > 50
ORDER BY price_usd DESC, rating ASC
LIMIT 15;

-- FINDING: [Fragrance has the most overpriced products.  
-- L'air Barbes Eau de Parfum is priced at $195 with a rating of just 3.0.
-- AERIN and brand 19-69 are the biggest offenders as they have high prices and poor customer satisfaction]
-- ------------------------------------------------


-- ------------------------------------------------
-- QUESTION 8: How does being out of stock affect product engagement?
-- Purpose: Tests whether out of stock products have higher loves counts thus showing we have unmet demand.
-- ------------------------------------------------

SELECT 
    CASE 
        WHEN out_of_stock = 1 THEN 'Out of Stock'
        ELSE 'In Stock'
    END AS stock_status,
    COUNT(product_id) AS total_products,
    ROUND(AVG(loves_count)) AS avg_loves,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(reviews)) AS avg_reviews
FROM sephora_clean
WHERE rating > 0
GROUP BY out_of_stock
ORDER BY avg_loves DESC;

-- FINDING: [Out of stock products average only 6,960  loves vs 28,748 for in stock products which suggests,
-- stock issues reduce visibility and engagement rather than creating desirability. 
-- Sephora should prioritise restocking to recover lost engagement]
-- ------------------------------------------------


-- ------------------------------------------------
-- QUESTION 9: Which brands are consistently  underperforming?
-- Purpose: Identifies brands that may need support, repositioning or removal from the catalogue
-- ------------------------------------------------

SELECT 
    brand_name,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(loves_count)) AS avg_loves,
    COUNT(product_id) AS total_products,
    SUM(reviews) AS total_reviews
FROM sephora_clean
WHERE rating > 0
GROUP BY brand_name
HAVING COUNT(product_id) >= 3
AND AVG(rating) < 4
ORDER BY avg_rating ASC
LIMIT 10;

-- FINDING: [Only 2 brands consistently underperform and they are: 19-69 (3.72) and AERIN (3.97). AERIN appears in both  
-- overpriced and underperforming lists making it the biggest concern for Sephora's catalogue strategy]
-- ------------------------------------------------

-- ================================================
-- SECTION C: RECOMMENDATIONS AND OPPORTUNITIES
-- ================================================

-- ------------------------------------------------
-- QUESTION 10: Which products on sale show improved engagement and does discounting work?
-- Purpose: Evaluates whether Sephora's discounting strategy is effectively driving customer interest
-- ------------------------------------------------

SELECT 
    on_sale,
    COUNT(product_id) AS total_products,
    ROUND(AVG(loves_count)) AS avg_loves,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(reviews)) AS avg_reviews,
    ROUND(AVG(price_usd)) AS avg_price
FROM sephora_clean
WHERE rating > 0
GROUP BY on_sale
ORDER BY avg_loves DESC;

-- FINDING: [Discounting does NOT appear to drive higher engagement as non sale products average 26,887 loves vs 5,235 for sale products. 
-- However only 2 products are on sale making this a very small sample.  
-- Sephora's discounting strategy is too limited to draw meaningful conclusions, more sale products  
-- needed to properly evaluate effectiveness]
-- ------------------------------------------------


-- ------------------------------------------------
-- QUESTION 11: Are new products performing as well as established ones?
-- Purpose: Compares new product launches against existing products to evaluate launch performance
-- ------------------------------------------------

SELECT 
    CASE 
        WHEN new = 1 THEN 'New Product'
        ELSE 'Established Product'
    END AS product_status,
    COUNT(product_id) AS total_products,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(loves_count)) AS avg_loves,
    ROUND(AVG(reviews)) AS avg_reviews
FROM sephora_clean
WHERE rating > 0
GROUP BY new
ORDER BY avg_loves DESC;

-- FINDING: [Established products significantly outperform new launches, averaging 27,406 loves  
-- vs 2,948 for new products and a higher rating of 4.21 vs 4.03. 
-- New products need time to build  customer trust and visibility before they can compete with established catalogue staples]
-- ------------------------------------------------


-- ------------------------------------------------
-- QUESTION 12: Which categories have the most out of stock products thus leading to unmet demand?
-- Purpose: Reveals where inventory gaps exist and where Sephora is potentially losing revenue
-- ------------------------------------------------

SELECT 
    primary_category,
    COUNT(product_id) AS total_products,
    SUM(CASE WHEN out_of_stock = 1 THEN 1 ELSE 0 END) AS out_of_stock_count,
    ROUND(SUM(CASE WHEN out_of_stock = 1 THEN 1 ELSE 0 END) * 100.0 
        / COUNT(product_id), 2) AS out_of_stock_percentage,
    ROUND(AVG(loves_count)) AS avg_loves
FROM sephora_clean
GROUP BY primary_category
ORDER BY out_of_stock_percentage DESC;

-- FINDING: [Bath & Body has the most critical stock problem with 33.33% of products out of stock.  
-- Hair has the highest absolute count at 12 out of stock products. 
-- Makeup is perfectly managed with 0% out of stock which is a model other categories should follow]
-- ------------------------------------------------


-- ------------------------------------------------
-- QUESTION 13: What price, rating and availability profile does a top performing product have?
-- Purpose: Build a success blueprint which is a data driven profile of what a winning Sephora product looks like.  
-- This is the headline recommendation of the analysis
-- ------------------------------------------------

SELECT 
    CASE 
        WHEN price_usd BETWEEN 0 AND 25 THEN 'Budget ($0-$25)'
        WHEN price_usd BETWEEN 26 AND 50 THEN 'Mid Range ($26-$50)'
        WHEN price_usd BETWEEN 51 AND 100 THEN 'Premium ($51-$100)'
        WHEN price_usd BETWEEN 101 AND 300 THEN 'Luxury ($101-$300)'
        ELSE 'Ultra Luxury ($300+)'
    END AS price_range,
    CASE 
        WHEN out_of_stock = 0 THEN 'In Stock'
        ELSE 'Out of Stock'
    END AS stock_status,
    CASE 
        WHEN sephora_exclusive = 1 THEN 'Exclusive'
        ELSE 'Non Exclusive'
    END AS exclusivity,
    ROUND(AVG(rating), 2) AS avg_rating,
    ROUND(AVG(loves_count)) AS avg_loves,
    ROUND(AVG(reviews)) AS avg_reviews,
    COUNT(product_id) AS total_products
FROM sephora_clean
WHERE rating > 0
AND out_of_stock = 0
GROUP BY price_range, stock_status, exclusivity
ORDER BY avg_loves DESC, avg_rating DESC
LIMIT 10;

-- FINDING: [THE SUCCESS BLUEPRINT:  
-- A winning Sephora product is Budget priced ($0-$25), always In Stock, and Non Exclusive, averaging 271,427 loves and a 4.15 rating. 
-- This profile generates 5x more engagement than the next best combination.
-- Sephora should prioritise stocking more affordable, widely available products to  
-- maximise customer engagement and catalogue performance]
-- ------------------------------------------------