CREATE OR REPLACE VIEW warehouse.vw_order_lifecycle AS

SELECT

    fol.order_lifecycle_key,

    fol.order_id,

    fol.customer_key,
    fol.warehouse_key,

    fol.order_status,

    fol.approval_days,
    fol.picking_days,
    fol.shipping_days,
    fol.order_cycle_days,

    od.full_date AS order_date,

    ad.full_date AS approval_date,

    pd.full_date AS pick_date,

    sd.full_date AS ship_date,

    dd.full_date AS delivery_date

FROM warehouse.fact_order_lifecycle fol

JOIN warehouse.dim_date od
    ON fol.order_date_key = od.date_key

LEFT JOIN warehouse.dim_date ad
    ON fol.approval_date_key = ad.date_key

LEFT JOIN warehouse.dim_date pd
    ON fol.pick_date_key = pd.date_key

LEFT JOIN warehouse.dim_date sd
    ON fol.ship_date_key = sd.date_key

LEFT JOIN warehouse.dim_date dd
    ON fol.delivery_date_key = dd.date_key;