CREATE OR REPLACE VIEW warehouse.vw_product_performance AS

SELECT

    dp.product_key,
    dp.product_id,
    dp.product_name,

    dp.category,
    dp.subcategory,
    dp.brand,

    SUM(fs.quantity) AS quantity_sold,

    SUM(fs.revenue) AS revenue,

    SUM(fs.cost) AS cost,

    SUM(fs.profit) AS profit,

    ROUND(
        SUM(fs.profit) * 100.0
        /
        NULLIF(
            SUM(fs.revenue),
            0
        ),
        2
    ) AS margin_pct

FROM warehouse.fact_sales fs

JOIN warehouse.dim_product dp
    ON fs.product_key = dp.product_key

GROUP BY

    dp.product_key,
    dp.product_id,
    dp.product_name,
    dp.category,
    dp.subcategory,
    dp.brand;