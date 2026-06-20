INSERT INTO warehouse.fact_sales (

    date_key,
    customer_key,
    product_key,
    warehouse_key,

    order_id,
    order_line_id,

    quantity,
    unit_price,
    unit_cost,
    discount_pct,

    revenue,
    cost,
    profit

)

SELECT

    dd.date_key,

    dc.customer_key,

    dp.product_key,

    dw.warehouse_key,

    o.order_id,

    ol.order_line_id,

    ol.quantity,

    ol.unit_price,

    ol.unit_cost,

    ol.discount_pct,

    ROUND(
        (ol.quantity * ol.unit_price)
        * (1 - ol.discount_pct / 100.0),
        2
    ) AS revenue,

    ROUND(
        ol.quantity * ol.unit_cost,
        2
    ) AS cost,

    ROUND(
        (
            (ol.quantity * ol.unit_price)
            * (1 - ol.discount_pct / 100.0)
        )
        -
        (
            ol.quantity * ol.unit_cost
        ),
        2
    ) AS profit

FROM staging.order_lines ol

INNER JOIN staging.orders o
    ON ol.order_id = o.order_id

INNER JOIN warehouse.dim_customer dc
    ON o.customer_id = dc.customer_id

INNER JOIN warehouse.dim_product dp
    ON ol.product_id = dp.product_id

INNER JOIN warehouse.dim_warehouse dw
    ON o.warehouse_id = dw.warehouse_id

INNER JOIN warehouse.dim_date dd
    ON o.order_date = dd.full_date;