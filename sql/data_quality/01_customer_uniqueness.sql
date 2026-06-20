/*
Check:
Customer business keys must be unique.
*/

SELECT
    customer_id,
    COUNT(*) AS duplicate_count
FROM warehouse.dim_customer
GROUP BY customer_id
HAVING COUNT(*) > 1;