# Sephora E-Commerce Product Performance Analysis
### What Makes a Beauty Product Succeed?

**Analyst:** Stephanie Mukami Gitonga  
**Tools:** Excel | MySQL | Power BI  
**Dataset:** Sephora Products Dataset — 8,494 products | Source: Kaggle

---

## 📌 Problem Statement
Sephora's e-commerce catalogue contains over 8,000 products across multiple categories and brands, yet product performance varies significantly. This analysis seeks to identify which products are performing best and understand the factors driving that performance which include pricing, customer ratings, brand positioning, and product availability.[cite: 3]

It also aims to uncover why certain products are underperforming and provide clear, data driven recommendations on what Sephora can do to improve their performance and overall catalogue strategy.[cite: 3]

---

## 🎯 Core Analytical Questions
* **Question 1:** What makes a product succeed? Is it pricing, ratings, brand strength, availability, or exclusivity?[cite: 3]
* **Question 2:** Why are some products failing? Are they overpriced, poorly rated, frequently out of stock, or in low demand categories?[cite: 3]

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
```[cite: 3]

---

## 🔄 Project Workflow

### Phase 1: Data Cleaning (Excel)
* Imported raw dataset of 8,494 Sephora products across 27 columns.[cite: 3]
* Identified and handled missing values across rating, reviews, sale price and category columns.[cite: 3]
* Created helper columns, **Has Rating (Yes/No)** and **On Sale (Yes/No)** so as to accurately flag missing numeric values without distorting calculations.[cite: 3]
* Removed irrelevant columns not needed for analysis.[cite: 3]
* Preserved raw data in a separate sheet throughout cleaning.[cite: 3]

### Phase 2: Data Analysis (MySQL)
* Imported cleaned dataset into MySQL Workbench.[cite: 3]
* Wrote 13 fully documented SQL queries across 3 analytical sections.[cite: 3]
* Each query includes purpose, logic and findings documented as comments.[cite: 3]

### Phase 3: Data Visualisation (Power BI)
* Connected Power BI directly to MySQL database.[cite: 3]
* Built a single page executive dashboard answering all 13 business questions.[cite: 3]
* Created calculated columns for Price Range and Product Status using DAX.[cite: 3]
* Added interactive slicers for Category and On Sale filtering.[cite: 3]

---

## 📊 Business Questions Answered

### Section A: What is Performing Well and Why?
1. Which product categories have the highest average ratings?[cite: 3]
2. Which brands are driving the most customer engagement?[cite: 3]
3. What is the ideal price range that produces the highest rated products?[cite: 3]
4. Do Sephora exclusive products perform better than non exclusive ones?[cite: 3]
5. Which individual products are the top performers overall?[cite: 3]

### Section B: What is Underperforming and Why?
6. Which categories have the lowest ratings and least engagement?[cite: 3]
7. Which products are overpriced relative to their rating?[cite: 3]
8. How does being out of stock affect product engagement?[cite: 3]
9. Which brands are consistently underperforming?[cite: 3]

### Section C: Recommendations and Opportunities
10. Which products on sale show improved engagement — does discounting work?[cite: 3]
11. Are new products performing as well as established ones?[cite: 3]
12. Which categories have the most out of stock products?[cite: 3]
13. What price, rating and availability profile does a top performing product have?[cite: 3]

---

## 💡 Key Findings

| Finding | Insight |
| :--- | :--- |
| **Top Category** | Makeup leads with an average rating of 4.52 and zero out of stock products.[cite: 3] |
| **Top Brand** | Anastasia Beverly Hills dominates with 4.1M total loves from just 9 products.[cite: 3] |
| **Best Price Point** | Budget products ($0-$25) generate the highest customer engagement.[cite: 3] |
| **Biggest Stock Issue** | Bath & Body has a 33% out of stock rate which is the worst in the catalogue.[cite: 3] |
| **Underperforming Brands** | AERIN (3.97) and 19-69 (3.72) consistently underperform. AERIN appears in both overpriced and underperforming lists making it the biggest catalogue concern.[cite: 3] |
| **Does Discounting Work?** | Non sale products average 26,887 loves vs 5,235 for sale products. However only 2 products are on sale making this too small a sample to draw meaningful conclusions.[cite: 3] |
| **New vs Established** | Established products average 27,406 loves vs 2,948 for new products.[cite: 3] |

---

## 🏆 Success Blueprint
A winning Sephora product is:
* Budget priced ($0 to $25)[cite: 3]
* Always in stock[cite: 3]
* Non exclusive[cite: 3]

This profile generates an average of **271,427 loves** which is 5x more engagement than any other product combination.[cite: 3] Sephora should prioritise stocking more affordable, widely available products to maximize customer engagement and catalogue performance.[cite: 3]

---

## 📸 Dashboard Preview
*(Upload your dashboard image to GitHub and update the link below)*
![Sephora Dashboard](PowerBI/Sephora_Dashboard_Screenshot.png)

---

## 🛠️ Tools Used
| Tool | Purpose |
| :--- | :--- |
| **Microsoft Excel** | Data cleaning and preparation[cite: 3] |
| **MySQL Workbench** | SQL querying and analysis[cite: 3] |
| **Power BI Desktop** | Dashboard and visualization[cite: 3] |

---

## 👩‍💻 About the Analyst
**Stephanie Mukami Gitonga** — Data Analyst based in Nairobi, Kenya  
* **Portfolio:** [Notion Portfolio](https://catkin-pineapple-59c.notion.site/Stephanie-Gitonga-Data-Analyst-Portfolio-33d1fe2dd2598087a352d7f8e8bdd54c)[cite: 3]
* **LinkedIn:** [linkedin.com/in/stephanalyzes](https://linkedin.com/in/stephanalyzes)[cite: 3]
* **Email:** mukamistephanie7@gmail.com[cite: 3]

*This project is part of my data analytics portfolio documenting my journey from learning to practice. Follow along on LinkedIn.*[cite: 3]
