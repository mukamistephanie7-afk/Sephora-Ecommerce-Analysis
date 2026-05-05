# Sephora E-Commerce Product Performance Analysis
### What Makes a Beauty Product Succeed?

**Analyst:** Stephanie Mukami Gitonga  
**Tools:** Excel | MySQL | Power BI  
**Dataset:** Sephora Products Dataset — 8,494 products | Source: Kaggle

---

## 📌 Problem Statement
Sephora's e-commerce catalogue contains over 8,000 products across multiple categories and brands, yet product performance varies significantly. This analysis seeks to identify which products are performing best and understand the factors driving that performance which include pricing, customer ratings, brand positioning, and product availability.

It also aims to uncover why certain products are underperforming and provide clear, data driven recommendations on what Sephora can do to improve their performance and overall catalogue strategy.

---

## 🎯 Core Analytical Questions
* **Question 1:** What makes a product succeed? Is it pricing, ratings, brand strength, availability, or exclusivity?
* **Question 2:** Why are some products failing? Are they overpriced, poorly rated, frequently out of stock, or in low demand categories?

---

## 📂 Project Structure
```text
Sephora-Ecommerce-Analysis/
├── Data/
│   └── Sephora_Clean.csv              # Cleaned dataset ready for analysis
├── Excel/
│   └── Sephora_Analysis_Working.xlsx  # Data cleaning workbook
├── SQL/
│   └── Sephora_SQL_Analysis.sql       # All 13 business questions queried and documented
├── PowerBI/
│   └── Sephora_Dashboard.pbix         # Interactive Power BI dashboard
└── README.md
```

---

## 🔄 Project Workflow

### Phase 1: Data Cleaning (Excel)
* Imported raw dataset of 8,494 Sephora products across 27 columns.
* Identified and handled missing values across rating, reviews, sale price and category columns.
* Created helper columns, **Has Rating (Yes/No)** and **On Sale (Yes/No)** so as to accurately flag missing numeric values without distorting calculations.
* Removed irrelevant columns not needed for analysis.
* Preserved raw data in a separate sheet throughout cleaning.

### Phase 2: Data Analysis (MySQL)
* Imported cleaned dataset into MySQL Workbench.
* Wrote 13 fully documented SQL queries across 3 analytical sections.
* Each query includes purpose, logic and findings documented as comments.

### Phase 3: Data Visualisation (Power BI)
* Connected Power BI directly to MySQL database.
* Built a single page executive dashboard answering all 13 business questions.
* Created calculated columns for Price Range and Product Status using DAX.
* Added interactive slicers for Category and On Sale filtering.

---

## 📊 Business Questions Answered

### Section A: What is Performing Well and Why?
1. Which product categories have the highest average ratings?
2. Which brands are driving the most customer engagement?
3. What is the ideal price range that produces the highest rated products?
4. Do Sephora exclusive products perform better than non exclusive ones?
5. Which individual products are the top performers overall?

### Section B: What is Underperforming and Why?
6. Which categories have the lowest ratings and least engagement?
7. Which products are overpriced relative to their rating?
8. How does being out of stock affect product engagement?
9. Which brands are consistently underperforming?

### Section C: Recommendations and Opportunities
10. Which products on sale show improved engagement — does discounting work?
11. Are new products performing as well as established ones?
12. Which categories have the most out of stock products?
13. What price, rating and availability profile does a top performing product have?

---

## 💡 Key Findings

| Finding | Insight |
| :--- | :--- |
| **Top Category** | Makeup leads with an average rating of 4.52 and zero out of stock products. |
| **Top Brand** | Anastasia Beverly Hills dominates with 4.1M total loves from just 9 products. |
| **Best Price Point** | Budget products ($0-$25) generate the highest customer engagement. |
| **Biggest Stock Issue** | Bath & Body has a 33% out of stock rate which is the worst in the catalogue.|
| **Underperforming Brands** | AERIN (3.97) and 19-69 (3.72) consistently underperform. AERIN appears in both overpriced and underperforming lists making it the biggest catalogue concern. |
| **Does Discounting Work?** | Non sale products average 26,887 loves vs 5,235 for sale products. However only 2 products are on sale making this too small a sample to draw meaningful conclusions. |
| **New vs Established** | Established products average 27,406 loves vs 2,948 for new products. |

---

## 🏆 Success Blueprint
A winning Sephora product is:
* Budget priced ($0 to $25)]
* Always in stock
* Non exclusive

This profile generates an average of **271,427 loves** which is 5x more engagement than any other product combination. Sephora should prioritise stocking more affordable, widely available products to maximize customer engagement and catalogue performance.

---

## 📸 Dashboard Preview
*(Upload your dashboard image to GitHub and update the link below)*
![Sephora Dashboard](PowerBI/Sephora_Dashboard_Screenshot.png)

---

## 🛠️ Tools Used
| Tool | Purpose |
| :--- | :--- |
| **Microsoft Excel** | Data cleaning and preparation|
| **MySQL Workbench** | SQL querying and analysis|
| **Power BI Desktop** | Dashboard and visualization|

---

## 👩‍💻 About the Analyst
**Stephanie Mukami Gitonga** — Data Analyst based in Nairobi, Kenya  
* **LinkedIn:** [linkedin.com/in/stephanalyzes](https://linkedin.com/in/stephanalyzes)
* **Email:** mukamistephanie7@gmail.com

*This project is part of my data analytics portfolio documenting my journey from learning to practice. Follow along on LinkedIn.
