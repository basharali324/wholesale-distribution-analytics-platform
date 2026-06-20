/*
Purpose:
Order Lifecycle Fact Table

Fact Type:
Accumulating Snapshot

Grain:
One row per Order

Author:
Mubasher Ali
*/

CREATE TABLE IF NOT EXISTS warehouse.fact_order_lifecycle
(
    order_lifecycle_key BIGSERIAL PRIMARY KEY,

    order_id VARCHAR(50) NOT NULL,

    customer_key INTEGER NOT NULL,

    warehouse_key INTEGER NOT NULL,

    order_date_key INTEGER NOT NULL,

    approval_date_key INTEGER,

    pick_date_key INTEGER,

    ship_date_key INTEGER,

    delivery_date_key INTEGER,

    approval_days INTEGER,

    picking_days INTEGER,

    shipping_days INTEGER,

    order_cycle_days INTEGER,

    order_status VARCHAR(50) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);