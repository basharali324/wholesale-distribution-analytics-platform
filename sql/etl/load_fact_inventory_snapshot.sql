/*
Purpose:
Load Fact Inventory Snapshot

Source:
staging.inventory_snapshot

Target:
warehouse.fact_inventory_snapshot

Fact Type:
Periodic Snapshot

Grain:
One row per Product, Warehouse, Day
*/

TRUNCATE TABLE warehouse.fact_inventory_snapshot;

INSERT INTO warehouse.fact_inventory_snapshot
(
    date_key,
    product_key,
    warehouse_key,
    on_hand_qty,
    reserved_qty,
    available_qty,
    inventory_value
)
SELECT

    dd.date_key,

    dp.product_key,

    dw.warehouse_key,

    s.on_hand_qty,

    s.reserved_qty,

    s.available_qty,

    s.inventory_value

FROM staging.inventory_snapshot s

INNER JOIN warehouse.dim_date dd
    ON s.snapshot_date = dd.full_date

INNER JOIN warehouse.dim_product dp
    ON s.product_id = dp.product_id

INNER JOIN warehouse.dim_warehouse dw
    ON s.warehouse_id = dw.warehouse_id;