# Business Requirements Document

## Project Name

Wholesale Distribution Analytics Platform

---

# 1. Business Overview

Global Wholesale Distribution Ltd is a medium-sized wholesale distribution company supplying products across the United Kingdom.

The business operates through multiple warehouses and suppliers while serving customers across retail, healthcare, education, logistics, hospitality, and industrial sectors.

The company currently relies on spreadsheet-based reporting and requires a centralized analytics platform to improve decision-making.

---

# 2. Business Goals

The organization requires a solution that:

* Provides a single source of truth
* Reduces manual reporting effort
* Improves inventory visibility
* Improves supplier performance monitoring
* Improves customer performance analysis
* Enables executive-level reporting
* Supports future scalability

---

# 3. Stakeholders

## Executive Team

Responsible for:

* Revenue growth
* Profitability
* Strategic decisions

Required Insights:

* Revenue trends
* Profit trends
* Customer growth
* Product performance

---

## Operations Managers

Responsible for:

* Warehouse efficiency
* Inventory management
* Order fulfilment

Required Insights:

* Inventory levels
* Stockout risks
* Warehouse performance
* Fulfilment times

---

## Procurement Team

Responsible for:

* Supplier management
* Purchasing strategy

Required Insights:

* Supplier lead times
* Supplier reliability
* Fill rates
* Purchase trends

---

## Sales Team

Responsible for:

* Customer relationships
* Sales growth

Required Insights:

* Customer profitability
* Regional sales
* Product sales performance
* Customer retention

---

# 4. Core Business Processes

## Order-to-Cash Process

Customer Places Order

↓

Order Processed

↓

Warehouse Pick

↓

Shipment

↓

Invoice Generated

↓

Payment Received

---

## Procure-to-Stock Process

Purchase Order Created

↓

Supplier Shipment

↓

Warehouse Receipt

↓

Inventory Updated

↓

Available for Sale

---

# 5. Executive KPIs

## Revenue

Definition:

Total sales value generated from customer orders.

Formula:

Revenue = Quantity × Unit Price

---

## Gross Profit

Definition:

Profit generated before operational expenses.

Formula:

Gross Profit = Revenue - Cost

---

## Gross Margin %

Definition:

Profitability percentage.

Formula:

Gross Margin % = Gross Profit / Revenue

---

## Revenue Growth %

Definition:

Growth compared to previous period.

---

## Active Customers

Definition:

Customers who placed at least one order during selected period.

---

# 6. Sales KPIs

## Revenue by Customer

Measure total revenue by customer.

---

## Revenue by Region

Measure sales performance across UK regions.

---

## Revenue by Product Category

Measure category-level sales.

---

## Average Order Value

Formula:

Revenue / Number of Orders

---

# 7. Inventory KPIs

## Inventory Value

Current stock value held.

---

## Inventory Turnover

Formula:

Cost of Goods Sold / Average Inventory

---

## Days of Inventory

Formula:

Average Inventory / Daily Demand

---

## Stockout Rate

Percentage of products unavailable when required.

---

# 8. Supplier KPIs

## Supplier Lead Time

Average days between purchase order and delivery.

---

## Supplier Fill Rate

Percentage of requested items delivered.

---

## Supplier Reliability Score

Composite performance score based on:

* Lead Time
* Fill Rate
* Delivery Performance

---

# 9. Warehouse KPIs

## Orders Fulfilled

Total completed orders.

---

## Fulfilment Time

Average time from order creation to shipment.

---

## Warehouse Utilisation

Current usage compared to capacity.

---

# 10. Data Quality Requirements

The platform must validate:

* Missing Customer IDs
* Missing Product IDs
* Duplicate Orders
* Negative Quantities
* Negative Revenue
* Invalid Dates
* Invalid Warehouse References
* Invalid Supplier References

Records failing validation must be logged.

---

# 11. Security Requirements

Regional Managers:

Access only assigned region.

Operations Team:

Access operational metrics.

Executives:

Access all data.

---

# 12. Future Enhancements

* Demand Forecasting
* Inventory Optimization
* Supplier Risk Scoring
* AI-Powered Insights
* Automated Alerting
* Fabric Migration

---

# 13. Success Criteria

The project is considered successful when:

* Data ingestion is automated
* Reporting is centralized
* KPIs are standardized
* Data quality controls are operational
* Executive reporting is available
* Operational reporting is available
* Supplier reporting is available
