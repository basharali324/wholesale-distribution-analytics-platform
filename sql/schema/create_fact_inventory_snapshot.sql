/*
Purpose:
Daily inventory snapshot.

Grain:
One row per product per warehouse per day.
*/

CREATE TABLE warehouse.fact_inventory_snapshot
(
    inventory_snapshot_key BIGSERIAL PRIMARY KEY,

    date_key INTEGER NOT NULL,

    product_key INTEGER NOT NULL,

    warehouse_key INTEGER NOT NULL,

    on_hand_qty INTEGER NOT NULL,

    reserved_qty INTEGER NOT NULL,

    available_qty INTEGER NOT NULL,

    inventory_value NUMERIC(18,2) NOT NULL
);