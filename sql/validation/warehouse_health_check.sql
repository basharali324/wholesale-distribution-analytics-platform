/*
Warehouse Health Dashboard
*/

SELECT
    COUNT(*) AS sales_rows,

    COUNT(DISTINCT customer_key)
        AS customers,

    COUNT(DISTINCT product_key)
        AS products,

    COUNT(DISTINCT warehouse_key)
        AS warehouses,

    ROUND(SUM(revenue),2)
        AS revenue,

    ROUND(SUM(cost),2)
        AS cost,

    ROUND(SUM(profit),2)
        AS profit
FROM warehouse.fact_sales;