# Source System Design

## Overview

The Wholesale Distribution Analytics Platform simulates a medium-sized UK wholesale distributor operating across multiple warehouses and serving customers across several industries.

The source system layer represents operational systems that generate business transactions.

The purpose of these source systems is to simulate realistic production data before ingestion into the analytics platform.

---

# Source Entities

## Customers

Represents organizations purchasing products from the company.

Industries include:

* Retail
* Healthcare
* Education
* Logistics
* Hospitality
* Manufacturing

Expected Volume:

100,000 records

---

## Products

Represents items sold by the business.

Categories include:

* Electronics
* Office Supplies
* Industrial Equipment
* Cleaning Products
* Packaging Materials

Expected Volume:

50,000 records

---

## Suppliers

Represents organizations supplying products.

Expected Volume:

300 records

---

## Warehouses

Represents physical storage locations.

Expected Volume:

10 warehouses

Regions:

* Scotland
* North England
* Midlands
* South England
* Wales

---

## Orders

Represents customer orders.

Expected Volume:

500,000 records

Status Values:

* Pending
* Approved
* Shipped
* Delivered
* Cancelled

---

## Order Lines

Represents products purchased within orders.

Expected Volume:

2,000,000 records

Business Rule:

One order can contain multiple order lines.

---

## Inventory Snapshots

Represents inventory position at a point in time.

Expected Volume:

250,000+ records

Business Rule:

One record per product per warehouse per snapshot date.

---

## Shipments

Represents supplier deliveries into warehouses.

Expected Volume:

300,000 records

Business Rule:

One record per shipment.

---

# Data Quality Scenarios

The generated data should intentionally include:

* Missing Product IDs
* Missing Customer IDs
* Duplicate Orders
* Invalid Dates
* Negative Quantities
* Late Shipments

These records will be used to test the Data Quality Framework.

---

# Data Generation Objectives

The generated data must:

* Maintain referential integrity
* Support dimensional modelling
* Support star schema design
* Support KPI calculations
* Support incremental loading scenarios
* Simulate realistic business behaviour

---

# Future Enhancements

* Returns Process
* Purchase Orders
* Customer Payments
* Demand Forecasts
* Promotions
* Pricing Changes
