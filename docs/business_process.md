# Business Process Document

## Overview

The Wholesale Distribution Analytics Platform supports the core operational processes of a wholesale distribution company.

The purpose of this document is to identify the major business processes that generate data and define the analytical requirements associated with each process.

---

# Process 1: Order-to-Cash

## Description

The Order-to-Cash process represents the complete customer sales lifecycle.

This process begins when a customer places an order and ends when payment is received.

---

## Workflow

Customer

↓

Order Created

↓

Order Approved

↓

Warehouse Pick

↓

Warehouse Pack

↓

Shipment

↓

Invoice Generated

↓

Payment Received

---

## Analytical Questions

* Revenue by Customer
* Revenue by Product
* Revenue by Region
* Average Order Value
* Customer Growth
* Order Volume Trends

---

## Primary Fact Table

FactSales

---

## Related Dimensions

DimCustomer

DimProduct

DimDate

DimWarehouse

---

# Process 2: Procure-to-Stock

## Description

The Procure-to-Stock process manages supplier purchases and inventory replenishment.

---

## Workflow

Purchase Order Created

↓

Supplier Receives Order

↓

Supplier Ships Goods

↓

Warehouse Receives Goods

↓

Inventory Updated

↓

Products Available for Sale

---

## Analytical Questions

* Supplier Performance
* Lead Time Analysis
* Fill Rate Analysis
* Procurement Trends

---

## Primary Fact Table

FactShipments

---

## Related Dimensions

DimSupplier

DimProduct

DimWarehouse

DimDate

---

# Process 3: Inventory Management

## Description

Inventory management tracks stock levels across warehouses.

---

## Workflow

Inventory Received

↓

Inventory Stored

↓

Inventory Sold

↓

Inventory Adjusted

↓

Inventory Replenished

---

## Analytical Questions

* Current Inventory
* Stockout Risk
* Inventory Turnover
* Days of Inventory

---

## Primary Fact Table

FactInventorySnapshot

---

## Related Dimensions

DimProduct

DimWarehouse

DimDate

---

# Process 4: Warehouse Operations

## Description

Warehouse operations support order fulfilment and inventory movement.

---

## Workflow

Order Received

↓

Pick

↓

Pack

↓

Ship

↓

Confirm Delivery

---

## Analytical Questions

* Orders Fulfilled
* Fulfilment Time
* Warehouse Utilisation
* Throughput

---

## Related Facts

FactSales

FactShipments

FactInventorySnapshot

---

# Fact Table Identification

## FactSales

Grain:

One row per order line.

---

## FactInventorySnapshot

Grain:

One row per product per warehouse per snapshot date.

---

## FactShipments

Grain:

One row per shipment.

---

# Dimension Identification

## DimCustomer

Customer attributes.

---

## DimProduct

Product attributes.

---

## DimSupplier

Supplier attributes.

---

## DimWarehouse

Warehouse attributes.

---

## DimDate

Calendar attributes.

---

# Analytical Model

The platform will use a dimensional modelling approach based on a Star Schema.

Facts contain measurable business events.

Dimensions provide descriptive business context.

This model supports scalable reporting and efficient analytical queries.
