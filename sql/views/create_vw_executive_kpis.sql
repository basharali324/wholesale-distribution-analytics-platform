CREATE OR REPLACE VIEW warehouse.vw_executive_kpis AS

SELECT

    COUNT(*) AS total_sales_rows,

    COUNT(
        DISTINCT customer_key
    ) AS total_customers,

    COUNT(
        DISTINCT product_key
    ) AS total_products,

    COUNT(
        DISTINCT warehouse_key
    ) AS total_warehouses,

    ROUND(
        SUM(revenue),
        2
    ) AS total_revenue,

    ROUND(
        SUM(cost),
        2
    ) AS total_cost,

    ROUND(
        SUM(profit),
        2
    ) AS total_profit,

    ROUND(
        SUM(profit) * 100.0
        /
        NULLIF(
            SUM(revenue),
            0
        ),
        2
    ) AS margin_pct

FROM warehouse.fact_sales;