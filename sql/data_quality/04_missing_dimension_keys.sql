/*
Check:
Fact table should not contain null foreign keys.
*/

SELECT
    SUM(CASE WHEN customer_key IS NULL THEN 1 ELSE 0 END)
        AS missing_customer_keys,

    SUM(CASE WHEN product_key IS NULL THEN 1 ELSE 0 END)
        AS missing_product_keys,

    SUM(CASE WHEN warehouse_key IS NULL THEN 1 ELSE 0 END)
        AS missing_warehouse_keys,

    SUM(CASE WHEN date_key IS NULL THEN 1 ELSE 0 END)
        AS missing_date_keys
FROM warehouse.fact_sales;