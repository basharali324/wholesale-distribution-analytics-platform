CREATE OR REPLACE VIEW warehouse.vw_category_growth AS

SELECT

    d.year_number,
    dp.category,

    SUM(fs.revenue) AS revenue,

    CASE

        WHEN dp.category = 'Electronics'
            THEN SUM(fs.revenue) * 1.35

        WHEN dp.category = 'Industrial'
            THEN SUM(fs.revenue) * 1.15

        WHEN dp.category = 'Office Supplies'
            THEN SUM(fs.revenue) * 1.05

        ELSE SUM(fs.revenue)

    END AS simulated_revenue

FROM warehouse.fact_sales fs

JOIN warehouse.dim_date d
    ON fs.date_key = d.date_key

JOIN warehouse.dim_product dp
    ON fs.product_key = dp.product_key

GROUP BY

    d.year_number,
    dp.category;