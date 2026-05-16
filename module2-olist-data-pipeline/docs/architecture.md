# Architecture Notes

## Current Project Architecture

```text
Olist CSV files
↓
Python / pandas data inspection
↓
DuckDB staging tables
↓
SQL transformation
↓
Star schema warehouse
↓
SQL data quality checks
↓
Jupyter Notebook business analysis
↓
Executive report and presentation

## Raw Data Relationship
customers
   ↓ customer_id
orders
   ↓ order_id
order_items
   ├── product_id → products → translation
   └── seller_id  → sellers

orders → payments
orders → reviews

customers / sellers → geolocation through zip code prefix