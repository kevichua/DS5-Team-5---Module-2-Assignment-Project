# DS5 Team 5 — Module 2 Assignment Project  
## Olist E-Commerce Data Warehouse and Analytics Pipeline

## 1. Project Overview

In this project, we act as a data engineering team building a complete system for moving, storing, transforming, validating, and analysing data.

This project uses the Olist Brazilian E-Commerce dataset to build an end-to-end data engineering pipeline. The pipeline ingests raw CSV files, stores them in staging tables, transforms them into an analytical warehouse, applies data quality checks, and uses Python to generate business insights.

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

```text
Raw CSV files
→ Python ingestion
→ DuckDB staging tables
→ SQL ELT transformation
→ Star schema warehouse
→ Data quality checks
→ Jupyter Notebook analysis
→ Executive presentation