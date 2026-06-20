/*
Check:
Lifecycle Fact Reconciliation
*/

SELECT
    (SELECT COUNT(*)
     FROM staging.order_lifecycle) AS staging_rows,

    (SELECT COUNT(*)
     FROM warehouse.fact_order_lifecycle) AS fact_rows;