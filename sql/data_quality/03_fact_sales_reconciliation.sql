/*
Check:
FactSales row count must equal source OrderLines.
*/

SELECT
    (SELECT COUNT(*)
     FROM staging.order_lines) AS source_rows,

    (SELECT COUNT(*)
     FROM warehouse.fact_sales) AS target_rows;