# Architecture

## Pipeline Overview

```
Kaggle CSVs (9 files)
    ↓ bq load
BigQuery: our-project-93971.kaggle_data  (raw, untouched)
    ↓ dbt run
Layer 1 — Staging        → olist_dev_staging    (views)
    ↓
Layer 2 — Data Quality   → olist_dev_data_quality  (tables, flagged rows only)
Layer 3 — Star Schema    → olist_dev_star           (tables, clean records only)
    ↓
Analysis — Jupyter notebooks / BigQuery
```

## dbt Commands

```bash
dbt debug   # verify BigQuery connection
dbt run     # build all three layers
dbt test    # run schema validation tests
```

## Layer 1 — Staging (olist_dev_staging)

Views. One model per source table. Rename columns, cast types, standardise nulls.
No filtering, no joins, no business logic.

Models: stg_orders, stg_customers, stg_order_items, stg_order_payments,
        stg_order_reviews, stg_products, stg_sellers, stg_geolocation,
        stg_category_name_translation

## Layer 2 — Data Quality (olist_dev_data_quality)

Tables. One model per staging model. Captures only rows that fail quality checks.
Each model has boolean flag columns per check and an issues summary column.
An empty table means clean data.

Models: dq_orders, dq_customers, dq_order_items, dq_order_payments,
        dq_order_reviews, dq_products, dq_sellers, dq_geolocation,
        dq_category_name_translation

## Layer 3 — Star Schema (olist_dev_star)

Tables. Clean records only — rows in the DQ layer are excluded via LEFT ANTI JOIN.

Fact tables:   fact_order_items, fact_orders
Dim tables:    dim_customers, dim_products, dim_sellers, dim_dates

## Raw Data Relationships

customers
   ↓ customer_id
orders
   ↓ order_id
order_items
   ├── product_id → products → category_name_translation
   └── seller_id  → sellers

orders → order_payments
orders → order_reviews

customers / sellers → geolocation (via zip_code_prefix)

## Full spec

See docs/superpowers/specs/2026-06-02-architecture-design.md
