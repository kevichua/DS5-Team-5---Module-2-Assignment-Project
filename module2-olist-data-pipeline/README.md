# DS5 Team 5 — Module 2 Assignment Project
## Olist E-Commerce Data Warehouse and Analytics Pipeline

---

## 1. Project Overview

This project builds an end-to-end ELT data pipeline for the Olist Brazilian E-Commerce dataset using GCP BigQuery and dbt. Raw CSV data is loaded into BigQuery, transformed through three dbt layers (staging → data quality → star schema), and analysed in Jupyter notebooks.

**Status:** Pipeline complete — 24 dbt models built, 53 tests passing.

---

## 2. Business Problem

Raw e-commerce data is spread across multiple operational files (orders, customers, products, sellers, payments, reviews). This makes it difficult for business teams to answer questions consistently.

This project creates a structured data warehouse to support analysis on:
- Monthly sales trends and revenue
- Top-selling product categories
- Customer purchasing behaviour
- Seller performance
- Delivery performance vs estimates
- Review score patterns

---

## 3. Architecture

```
Kaggle CSVs (9 files)
    ↓ bq load
BigQuery: our-project-93971.kaggle_data   ← raw, untouched
    ↓ dbt run
olist_dev_staging     (views)             ← Layer 1: rename, cast, standardise
    ↓                      ↓
olist_dev_data_quality     olist_dev_star ← Layer 2: flag issues | Layer 3: clean star schema
(tables)                   (tables)
    ↓
Analysis — Jupyter notebooks / BigQuery
```

See [`docs/architecture.md`](docs/architecture.md) for the full design.

---

## 4. Dataset

**Source:** Brazilian E-Commerce Public Dataset by Olist (Kaggle)
**Loaded into:** `our-project-93971.kaggle_data` (BigQuery)

| Table | Rows |
|---|---:|
| orders | 99,441 |
| customers | 99,441 |
| order_items | 112,650 |
| order_payments | 103,886 |
| order_reviews | 99,224 |
| products | 32,951 |
| sellers | 3,095 |
| geolocation | 1,000,163 |
| category_name_translation | 71 |

All 9 tables verified to match local CSVs exactly.

---

## 5. dbt Pipeline

**Project:** `our_project`
**Profile:** `our_project` → BigQuery (`our-project-93971`), oauth, location: US

### Layer 1 — Staging (`olist_dev_staging`)
9 views. One per source table. Renames columns, casts data types, standardises nulls. No rows removed.

| Model | Key changes |
|---|---|
| `stg_orders` | 5 timestamp columns cast to TIMESTAMP |
| `stg_customers` | zip_code_prefix standardised to STRING |
| `stg_order_items` | price, freight_value cast to FLOAT64 |
| `stg_order_payments` | payment_value cast to FLOAT64 |
| `stg_order_reviews` | dates cast, empty comments → NULL |
| `stg_products` | dimensions cast to INT64, typos fixed in column names |
| `stg_sellers` | zip_code_prefix standardised to STRING |
| `stg_geolocation` | lat/lng cast to FLOAT64 |
| `stg_category_name_translation` | English name column renamed |

### Layer 2 — Data Quality (`olist_dev_data_quality`)
9 tables. Stores only flagged rows. Empty table = clean data.

| Model | Flagged rows | Main issues |
|---|---:|---|
| `dq_orders` | 0 | Clean ✅ |
| `dq_customers` | 0 | Clean ✅ |
| `dq_order_items` | 0 | Clean ✅ |
| `dq_order_payments` | 9 | Zero/negative payment values |
| `dq_order_reviews` | 0 | Clean ✅ |
| `dq_products` | 611 | 609 missing category name, 2 missing dimensions |
| `dq_sellers` | 0 | Clean ✅ |
| `dq_geolocation` | 42 | Coordinates outside Brazil bounds |
| `dq_category_name_translation` | 0 | Clean ✅ |

See [`docs/data_quality_report.md`](docs/data_quality_report.md) for full details.

### Layer 3 — Star Schema (`olist_dev_star`)
6 tables. Clean records only — DQ-flagged rows excluded.

| Model | Rows | Description |
|---|---:|---|
| `fact_order_items` | 112,650 | Revenue fact — one row per order line item |
| `fact_orders` | 99,400 | Order fact — delivery times, review score, payment total |
| `dim_customers` | 99,441 | Customer dimension |
| `dim_products` | 32,340 | Product dimension with English category names |
| `dim_sellers` | 3,095 | Seller dimension |
| `dim_dates` | 1,096 | Generated date spine (2016–2018) |

See [`docs/schema_design.md`](docs/schema_design.md) for column definitions and sample queries.

---

## 6. Running the Pipeline

**Prerequisites:** conda env `elt` with dbt-bigquery, GCP credentials via `gcloud auth application-default login`.

```bash
cd our_project

# 1. Verify connection
/home/fionalyh/miniconda3/envs/elt/bin/dbt debug

# 2. Build all models
/home/fionalyh/miniconda3/envs/elt/bin/dbt run

# 3. Run all tests
/home/fionalyh/miniconda3/envs/elt/bin/dbt test
```

Expected: `24 of 24 OK` on run, `53 of 53 PASS` on test.

---

## 7. Project Structure

```
module2-olist-data-pipeline/
├── data/
│   └── raw/                          ← Local copies of the 9 CSVs
├── docs/
│   ├── architecture.md               ← Pipeline design and layer details
│   ├── data_dictionary.md            ← Column definitions and staging mapping
│   ├── data_quality_report.md        ← DQ findings with actual row counts
│   └── schema_design.md              ← Star schema with sample queries
├── notebooks/
│   └── 01_data_understanding.ipynb   ← EDA + staging/DQ explanation
└── README.md

our_project/                          ← dbt project root
├── dbt_project.yml
├── models/
│   ├── sources.yml                   ← All 9 BigQuery source tables declared
│   ├── staging/                      ← 9 stg_* view models
│   ├── data_quality/                 ← 9 dq_* table models
│   └── star/                         ← 2 fact + 4 dim table models
└── ...
```

---

## 8. Documentation

| File | Contents |
|---|---|
| [`docs/architecture.md`](docs/architecture.md) | Full pipeline architecture, dbt config, layer-by-layer design |
| [`docs/data_dictionary.md`](docs/data_dictionary.md) | Raw table summaries, staging column mapping |
| [`docs/data_quality_report.md`](docs/data_quality_report.md) | DQ check results, flagged row counts, how to query issues |
| [`docs/schema_design.md`](docs/schema_design.md) | Star schema diagram, column types, common analysis queries |
