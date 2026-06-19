SELECT
    customer_id,
    COUNT(*)
FROM staging.customers
GROUP BY customer_id
HAVING COUNT(*) > 1;