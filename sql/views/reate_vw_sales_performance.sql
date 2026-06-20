/*
Purpose:
Sales Performance Semantic View

Used By:
Executive Dashboard
Sales Dashboard
Product Performance Dashboard

Author:
Mubasher Ali
*/

CREATE OR REPLACE VIEW warehouse.vw_sales_performance AS

SELECT

    fs.sales_key,

    fs.order_id,
    fs.order_line_id,

    d.full_date,
    d.day_name,
    d.week_number,
    d.month_name,
    d.quarter_number,
    d.year_number,

    dc.customer_key,
    dc.customer_id,
    dc.customer_name,
    dc.customer_type,
    dc.region,

    dp.product_key,
    dp.product_id,
    dp.product_name,
    dp.category,
    dp.subcategory,
    dp.brand,

    dw.warehouse_key,
    dw.warehouse_id,
    dw.warehouse_name,
    dw.region AS warehouse_region,

    fs.quantity,
    fs.unit_price,
    fs.unit_cost,
    fs.discount_pct,

    fs.revenue,
    fs.cost,
    fs.profit,

    ROUND(
        fs.profit * 100.0
        /
        NULLIF(fs.revenue, 0),
        2
    ) AS margin_pct

FROM warehouse.fact_sales fs

INNER JOIN warehouse.dim_date d
    ON fs.date_key = d.date_key

INNER JOIN warehouse.dim_customer dc
    ON fs.customer_key = dc.customer_key

INNER JOIN warehouse.dim_product dp
    ON fs.product_key = dp.product_key

INNER JOIN warehouse.dim_warehouse dw
    ON fs.warehouse_key = dw.warehouse_key;