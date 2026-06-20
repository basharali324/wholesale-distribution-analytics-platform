/*
Purpose:
Load Order Lifecycle Fact

Source:
staging.order_lifecycle

Target:
warehouse.fact_order_lifecycle

Fact Type:
Accumulating Snapshot

Grain:
One row per Order
*/

TRUNCATE TABLE warehouse.fact_order_lifecycle;

INSERT INTO warehouse.fact_order_lifecycle
(
    order_id,
    customer_key,
    warehouse_key,

    order_date_key,
    approval_date_key,
    pick_date_key,
    ship_date_key,
    delivery_date_key,

    approval_days,
    picking_days,
    shipping_days,
    order_cycle_days,

    order_status
)
SELECT

    s.order_id,

    dc.customer_key,

    dw.warehouse_key,

    od.date_key,
    ad.date_key,
    pd.date_key,
    sd.date_key,
    dd.date_key,

    CASE
        WHEN s.approval_date IS NOT NULL
        THEN s.approval_date - s.order_date
    END AS approval_days,

    CASE
        WHEN s.pick_date IS NOT NULL
        THEN s.pick_date - s.approval_date
    END AS picking_days,

    CASE
        WHEN s.ship_date IS NOT NULL
        THEN s.ship_date - s.pick_date
    END AS shipping_days,

    CASE
        WHEN s.delivery_date IS NOT NULL
        THEN s.delivery_date - s.order_date
    END AS order_cycle_days,

    s.order_status

FROM staging.order_lifecycle s

INNER JOIN warehouse.dim_customer dc
    ON s.customer_id = dc.customer_id

INNER JOIN warehouse.dim_warehouse dw
    ON s.warehouse_id = dw.warehouse_id

INNER JOIN warehouse.dim_date od
    ON s.order_date = od.full_date

LEFT JOIN warehouse.dim_date ad
    ON s.approval_date = ad.full_date

LEFT JOIN warehouse.dim_date pd
    ON s.pick_date = pd.full_date

LEFT JOIN warehouse.dim_date sd
    ON s.ship_date = sd.full_date

LEFT JOIN warehouse.dim_date dd
    ON s.delivery_date = dd.full_date;