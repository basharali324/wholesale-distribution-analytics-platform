# Wholesale Distribution Analytics Platform

![Python](https://img.shields.io/badge/Python-3.12+-blue)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-blue)
![Power BI](https://img.shields.io/badge/Power%20BI-Analytics-yellow)
![Docker](https://img.shields.io/badge/Docker-Containerized-blue)
![SQL](https://img.shields.io/badge/SQL-Advanced-green)
![License](https://img.shields.io/badge/License-MIT-green)

A production-style Analytics Engineering project that demonstrates how a wholesale distribution company can modernize fragmented operational data into a governed analytics platform for reporting, inventory optimization, sales analysis, and executive decision-making.

---

# Executive Summary

Wholesale distributors often rely on spreadsheets, disconnected operational systems, and manually prepared reports.

This project demonstrates how to build a modern analytics platform that:

* Centralizes operational data
* Validates data quality
* Builds a dimensional warehouse
* Produces trusted KPIs
* Supports Power BI dashboards
* Enables scalable reporting

The repository follows engineering practices commonly used in enterprise Business Intelligence and Analytics Engineering teams.

---

# Business Problem

Wholesale distribution companies typically struggle with:

* Manual Excel reporting
* Duplicate data
* Poor inventory visibility
* Inconsistent KPI definitions
* Slow reporting cycles
* Limited executive insight

The objective of this project is to create a governed reporting platform that provides a single source of truth for operational analytics.

---

# Solution Overview

The solution consists of four major components.

```
Operational Data
        │
        ▼
Python ETL
        │
        ▼
PostgreSQL Data Warehouse
        │
        ▼
Dimensional Model
        │
        ▼
Power BI Semantic Model
        │
        ▼
Executive Dashboards
```

---

# Solution Architecture

```
             Source Systems
─────────────────────────────────
 Sales
 Products
 Customers
 Warehouses
 Suppliers

            │
            ▼

      Python ETL Pipeline

            │
            ▼

     PostgreSQL Warehouse

            │

    ┌───────────────┐
    │ Dimension Data│
    └───────────────┘

    ┌───────────────┐
    │ Fact Tables   │
    └───────────────┘

            │
            ▼

 Power BI Semantic Model

            │
            ▼

 Executive Dashboards
```

---

# Technology Stack

| Area             | Technology     |
| ---------------- | -------------- |
| Programming      | Python         |
| Database         | PostgreSQL     |
| SQL              | PostgreSQL SQL |
| Reporting        | Power BI       |
| Version Control  | Git            |
| Repository       | GitHub         |
| Containerization | Docker         |
| Data Modelling   | Star Schema    |
| Analytics        | KPI Design     |

---

# Key Features

## Data Warehouse

* Star Schema
* Fact tables
* Dimension tables
* Slowly changing dimensions ready
* Business keys
* Surrogate keys

---

## ETL

* Python ingestion
* Data cleansing
* Validation
* Transformation
* Data loading

---

## Data Quality

Validation includes

* Missing values
* Duplicate detection
* Invalid dates
* Foreign key checks
* Negative quantities
* Business rule validation

---

## Analytics

Executive KPIs including

* Revenue
* Gross Profit
* Margin
* Inventory Turnover
* Fill Rate
* Order Volume
* Average Order Value
* Supplier Performance
* Warehouse Performance

---

# Data Model

## Fact Tables

* fact_sales
* fact_inventory
* fact_shipments

## Dimension Tables

* dim_customer
* dim_product
* dim_supplier
* dim_date
* dim_warehouse

---

# Repository Structure

```
wholesale-distribution-analytics-platform/

docs/
    architecture.md
    business_requirements.md
    data_dictionary.md
    kpi_definitions.md

sql/
    schema/
    staging/
    warehouse/
    views/
    quality_checks/

python/
    etl/
    generators/
    validation/

powerbi/

images/

docker/

tests/

README.md
```

---

# ETL Workflow

```
CSV Files

↓

Validation

↓

Cleaning

↓

Transformation

↓

Warehouse Load

↓

Business Views

↓

Power BI
```

---

# Dashboard Pages

The Power BI solution contains multiple analytical views.

### Executive Dashboard

* Revenue
* Profit
* Margin
* Sales Trend

### Inventory Dashboard

* Stock Levels
* Stock Cover
* Inventory Value

### Warehouse Dashboard

* Warehouse Performance
* Fulfilment
* Capacity

### Supplier Dashboard

* Supplier Lead Time
* Delivery Performance

### Sales Dashboard

* Product Performance
* Customer Analysis
* Revenue Trends

---

# Example KPIs

| KPI                 | Description                   |
| ------------------- | ----------------------------- |
| Revenue             | Total sales                   |
| Profit              | Revenue minus cost            |
| Margin %            | Profitability                 |
| Inventory Turnover  | Stock efficiency              |
| Fill Rate           | Order fulfilment              |
| Average Order Value | Customer purchasing behaviour |

---

# Data Quality Framework

The project validates data before loading into the warehouse.

Checks include:

* Duplicate Orders
* Missing Customer IDs
* Invalid Product IDs
* Invalid Warehouse IDs
* Negative Sales
* Future Dates
* Null Values

All failed records can be routed to exception tables for investigation.

---

# Engineering Practices

* Modular SQL
* Layered ETL
* Reusable Python scripts
* Version Control
* Documentation
* Business-first modelling

---

# Business Value

This solution demonstrates how analytics can help businesses:

* Reduce manual reporting
* Improve reporting accuracy
* Increase inventory visibility
* Monitor operational performance
* Standardize KPI definitions
* Enable executive decision-making

---

# Skills Demonstrated

* Analytics Engineering
* Data Warehousing
* SQL Development
* Python ETL
* Power BI
* Data Modelling
* Data Quality
* Business Intelligence
* KPI Design
* Git & GitHub
* Docker

---

# Future Enhancements

* Microsoft Fabric Migration
* Lakehouse Architecture
* Incremental Loading
* Automated Testing
* CI/CD Pipeline
* Data Catalog
* Row-Level Security
* Predictive Analytics
* Forecasting Models
* AI-powered Business Insights

---

# Screenshots

Create an `images/` folder and include:

```
images/
├── architecture.png
├── dashboard-executive.png
├── dashboard-sales.png
├── dashboard-inventory.png
├── star-schema.png
```

Then embed them using:

```markdown
![Architecture](images/architecture.png)

![Executive Dashboard](images/dashboard-executive.png)
```

---

# How to Run

1. Clone the repository.
2. Start PostgreSQL using Docker.
3. Load sample datasets.
4. Execute SQL scripts.
5. Run Python ETL.
6. Refresh the Power BI model.
7. Explore dashboards.

---

# Author

**Mubasher Ali**

Business Intelligence Developer • Analytics Engineer • Microsoft Fabric Enthusiast

LinkedIn: https://linkedin.com/in/mubasher-a-b91a14125

GitHub: https://github.com/basharali324
