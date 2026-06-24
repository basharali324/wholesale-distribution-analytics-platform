CREATE OR REPLACE VIEW warehouse.vw_monthly_sales_trend AS

SELECT

    d.year_number,
    d.month_number,
    d.month_name,

    SUM(fs.revenue) AS revenue,
    SUM(fs.profit) AS profit

FROM warehouse.fact_sales fs

JOIN warehouse.dim_date d
    ON fs.date_key = d.date_key

GROUP BY

    d.year_number,
    d.month_number,
    d.month_name

ORDER BY

    d.year_number,
    d.month_number;