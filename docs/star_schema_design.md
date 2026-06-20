# Star Schema Design

## Overview

The Wholesale Distribution Analytics Platform uses a dimensional modelling approach based on a Star Schema.

The purpose of the Star Schema is to support scalable analytics, simplify reporting, and improve query performance.

---

# FactSales

## Business Process

Order-to-Cash

---

## Grain

One row per order line.

Each record represents a single product sold within a customer order.

---

## Measures

* Quantity
* Revenue
* Cost
* Profit
* Discount Amount

---

## Foreign Keys

* DateKey
* CustomerKey
* ProductKey
* WarehouseKey

---

# FactInventorySnapshot

## Business Process

Inventory Management

---

## Grain

One row per product per warehouse per snapshot date.

---

## Measures

* StockQty
* InventoryValue

---

## Foreign Keys

* DateKey
* ProductKey
* WarehouseKey

---

# FactShipments

## Business Process

Procure-to-Stock

---

## Grain

One row per supplier shipment.

---

## Measures

* QuantityDelivered
* LeadTimeDays

---

## Foreign Keys

* DateKey
* SupplierKey
* WarehouseKey

---

# Dimension Tables

## DimCustomer

Customer attributes including region, city, type, and account ownership.

---

## DimProduct

Product attributes including category, subcategory, brand, and supplier relationship.

---

## DimSupplier

Supplier attributes including country, lead time, rating, and supplier type.

---

## DimWarehouse

Warehouse attributes including region and storage capacity.

---

## DimDate

Calendar attributes used for time intelligence and trend analysis.

---

# Relationship Design

FactSales

DimCustomer → FactSales

DimProduct → FactSales

DimWarehouse → FactSales

DimDate → FactSales

---

FactInventorySnapshot

DimProduct → FactInventorySnapshot

DimWarehouse → FactInventorySnapshot

DimDate → FactInventorySnapshot

---

FactShipments

DimSupplier → FactShipments

DimWarehouse → FactShipments

DimDate → FactShipments

---

# Modelling Principles

* Single-direction filtering
* Star schema design
* Surrogate keys in warehouse
* Business keys retained for traceability
* No many-to-many relationships
* Semantic layer calculations implemented in Power BI
