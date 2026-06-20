/*
Check:
Identify loss-making transactions.
*/

SELECT
    COUNT(*) AS negative_profit_rows
FROM warehouse.fact_sales
WHERE profit < 0;