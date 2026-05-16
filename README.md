# DS5-Team-5---Module-2-Assignment-Project-
In this project, we are a data engineering team building a complete system for moving and analyzing data. We place raw data files into a digital warehouse, perform data cleansing, and then use Python to find helpful information.

# Olist E-Commerce Data Warehouse and Analytics Pipeline

## 1. Project Overview
This project builds an end-to-end data engineering pipeline using the Olist Brazilian E-Commerce dataset. The pipeline ingests raw CSV files, stores them in staging tables, transforms them into an analytical warehouse, applies data quality checks, and uses Python to generate business insights.

## 2. Business Problem
Raw e-commerce data is usually spread across multiple operational files such as orders, customers, products, sellers, payments, and reviews. This makes it difficult for business teams to answer questions quickly and consistently.

This project creates a structured data warehouse to support business analysis on:
- Monthly sales trends
- Top-selling product categories
- Customer purchasing behaviour
- Seller performance
- Delivery performance
- Review score patterns

## 3. Project Objective
The objective is to design and implement a simple, reliable, and explainable data engineering system that transforms raw e-commerce data into analysis-ready tables for business decision-making.

## 4. Dataset
Dataset: Brazilian E-Commerce Public Dataset by Olist

Main data entities expected:
- Orders
- Order items
- Customers
- Products
- Sellers
- Payments
- Reviews
- Geolocation

## 5. Proposed Architecture

Raw CSV files  
→ Python ingestion  
→ DuckDB staging tables  
→ SQL ELT transformation  
→ Star schema warehouse  
→ Data quality checks  
→ Jupyter Notebook analysis  
→ Executive presentation

## 6. Tools Used

| Layer | Tool |
|---|---|
| Development | VS Code BDE environment |
| Data ingestion | Python |
| Local database / warehouse | DuckDB |
| Database viewer | DBGate |
| Analysis | Jupyter Notebook, pandas |
| Transformation | SQL |
| Documentation | Markdown |
| Diagramming | draw.io |
| Optional cloud extension | Google Cloud Storage / BigQuery |

## 7. Planned Warehouse Design

The project will use a star schema design.

Expected fact table:
- fact_order_items

Expected dimension tables:
- dim_customers
- dim_products
- dim_sellers
- dim_date
- dim_payments
- dim_reviews

## 8. Planned Analysis Questions

1. How do monthly sales change over time?
2. Which product categories generate the most revenue?
3. Which customer states or cities contribute the most orders?
4. Do delivery delays affect review scores?
5. Which sellers or product categories may need operational attention?

## 9. Project Timeline

| Date range | Course topic | Assignment phase | Main output | Recommended tools |
|---|---|---|---|---|
| May 11–17 | Big Data + Architecture | Project planning | README, architecture draft | VS Code, draw.io |
| May 18–19 | Data encoding/flow | Data understanding | Data dictionary, raw ERD | Jupyter, pandas |
| May 20–24 | Extraction/scraping | Ingestion | Load raw CSVs to staging | Python, DuckDB, DBGate |
| May 25 | Data warehouse | Star schema | Fact/dimension tables | SQL, DBGate |
| May 26–Jun 1 | Pipelines/orchestration | ELT pipeline | Transform staging to warehouse | SQL, Python |
| Jun 2 | Testing | Data quality checks | SQL test report | SQL, Python |
| Jun 3–7 | Out-of-core | Scalability | Chunking/performance notes | pandas, DuckDB |
| Jun 8–9 | Distributed batch | Batch design | Current vs future batch architecture | Google Cloud optional |
| Jun 10 onwards | Streaming | Finalisation | Final report + deck | Jupyter, PowerPoint |

## 10. Expected Deliverables

- GitHub repository
- README documentation
- Architecture diagram
- Data dictionary
- SQL scripts
- Python ingestion script
- Data quality report
- Jupyter Notebook analysis
- Executive presentation deck
