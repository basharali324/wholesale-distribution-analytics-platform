CREATE OR REPLACE VIEW warehouse.vw_warehouse_performance AS

SELECT

    dw.warehouse_key,

    dw.warehouse_id,

    dw.warehouse_name,

    COUNT(*) AS sales_lines,

    SUM(fs.quantity) AS quantity_sold,

    SUM(fs.revenue) AS revenue,

    SUM(fs.cost) AS cost,

    SUM(fs.profit) AS profit

FROM warehouse.fact_sales fs

JOIN warehouse.dim_warehouse dw
    ON fs.warehouse_key = dw.warehouse_key

GROUP BY

    dw.warehouse_key,
    dw.warehouse_id,
    dw.warehouse_name;