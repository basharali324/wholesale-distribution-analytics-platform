CREATE TABLE staging.customers (

    customer_id VARCHAR(20),

    customer_name VARCHAR(255),

    customer_type VARCHAR(100),

    region VARCHAR(100),

    city VARCHAR(100),

    postcode VARCHAR(20),

    account_manager VARCHAR(255),

    created_date DATE

);


CREATE TABLE staging.products (

    product_id VARCHAR(20),

    product_name VARCHAR(255),

    category VARCHAR(100),

    subcategory VARCHAR(100),

    brand VARCHAR(255),

    supplier_id VARCHAR(20),

    unit_cost NUMERIC(10,2),

    unit_price NUMERIC(10,2)

);

CREATE TABLE staging.suppliers (

    supplier_id VARCHAR(20),

    supplier_name VARCHAR(255),

    country VARCHAR(100),

    supplier_type VARCHAR(100),

    lead_time_days INTEGER,

    rating NUMERIC(3,1),

    created_date DATE

);


CREATE TABLE staging.warehouses (

    warehouse_id VARCHAR(20),

    warehouse_name VARCHAR(255),

    region VARCHAR(100),

    capacity INTEGER

);

CREATE TABLE staging.orders (

    order_id VARCHAR(20),

    customer_id VARCHAR(20),

    warehouse_id VARCHAR(20),

    order_date DATE,

    order_status VARCHAR(50)

);

CREATE TABLE staging.order_lines (

    order_line_id VARCHAR(20),

    order_id VARCHAR(20),

    product_id VARCHAR(20),

    quantity INTEGER,

    unit_price NUMERIC(10,2),

    unit_cost NUMERIC(10,2),

    discount_pct NUMERIC(5,2)

);


/*
Purpose:
Inventory Snapshot Staging Table
*/

CREATE TABLE IF NOT EXISTS staging.inventory_snapshot
(
    snapshot_date DATE NOT NULL,

    product_id VARCHAR(50) NOT NULL,

    warehouse_id VARCHAR(50) NOT NULL,

    on_hand_qty INTEGER NOT NULL CHECK (on_hand_qty >= 0),

    reserved_qty INTEGER NOT NULL CHECK (reserved_qty >= 0),

    available_qty INTEGER NOT NULL CHECK (available_qty >= 0),

    inventory_value NUMERIC(18,2) NOT NULL CHECK (inventory_value >= 0)
);


/*
Purpose:
Order Lifecycle Staging Table

Source:
data/raw/order_lifecycle.csv

Grain:
One row per Order

Author:
Mubasher Ali
*/

CREATE TABLE IF NOT EXISTS staging.order_lifecycle
(
    order_id VARCHAR(50) NOT NULL,

    customer_id VARCHAR(50) NOT NULL,

    warehouse_id VARCHAR(50) NOT NULL,

    order_date DATE NOT NULL,

    approval_date DATE,

    pick_date DATE,

    ship_date DATE,

    delivery_date DATE,

    order_status VARCHAR(50) NOT NULL
);