# Architecture Document

## Solution Overview

The Wholesale Distribution Analytics Platform is designed using a layered analytics architecture.

The objective is to provide a scalable, maintainable, and production-ready reporting platform for wholesale distribution businesses.

---

# Architecture Layers

Source Systems
↓
Landing Layer
↓
Data Quality Layer
↓
Transformation Layer
↓
Warehouse Layer
↓
Semantic Layer
↓
Reporting Layer

---

# Source Layer

Simulated operational systems provide source data.

Files include:

* Customers
* Products
* Suppliers
* Warehouses
* Orders
* Order Lines
* Inventory Snapshots
* Shipments

Source data is treated as immutable.

---

# Landing Layer

Purpose:

Store raw source data without modification.

Location:

data/raw/

Responsibilities:

* Raw ingestion
* Auditability
* Recovery

---

# Data Quality Layer

Purpose:

Validate incoming records.

Checks:

* Duplicate Orders
* Missing Product IDs
* Missing Customer IDs
* Invalid Dates
* Negative Quantities
* Negative Revenue

Output:

Data Quality Logs

Location:

logs/

---

# Transformation Layer

Purpose:

Prepare data for dimensional modelling.

Responsibilities:

* Standardisation
* Cleansing
* Business Rule Enforcement
* Surrogate Key Generation

Technology:

Python

---

# Warehouse Layer

Technology:

PostgreSQL

Model:

Star Schema

Dimensions:

* DimCustomer
* DimProduct
* DimSupplier
* DimWarehouse
* DimDate

Facts:

* FactSales
* FactInventorySnapshot
* FactShipments

---

# Semantic Layer

Technology:

Power BI

Purpose:

Provide governed KPI definitions.

Measures:

* Revenue
* Profit
* Margin %
* Inventory Turnover
* Fill Rate
* Lead Time

---

# Reporting Layer

Executive Dashboard

Operations Dashboard

Supplier Performance Dashboard

Sales Performance Dashboard

---

# Security

Role-Based Access Control

Regional Managers:

Region-specific visibility

Executives:

Full access

---

# Monitoring

ETL execution logging

Data quality logging

Refresh monitoring

Future alerting support

---

# Future Enhancements

* Fabric Migration
* Demand Forecasting
* AI Insights
* Inventory Optimization
* Supplier Risk Scoring
