/*
Check:
Product business keys must be unique.
*/

SELECT
    product_id,
    COUNT(*) AS duplicate_count
FROM warehouse.dim_product
GROUP BY product_id
HAVING COUNT(*) > 1;