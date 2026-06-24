CREATE OR REPLACE VIEW warehouse.vw_simulated_business_trend AS

SELECT

    year_number,
    month_number,
    month_name,

    ROUND(

        adjusted_revenue *

        CASE

            WHEN month_number IN (10,11,12)
                THEN 1.25

            WHEN month_number = 1
                THEN 0.85

            WHEN month_number IN (6,7,8)
                THEN 1.10

            ELSE 1.00

        END

    ,2) AS revenue,

    ROUND(

        adjusted_profit *

        CASE

            WHEN month_number IN (10,11,12)
                THEN 1.25

            WHEN month_number = 1
                THEN 0.85

            WHEN month_number IN (6,7,8)
                THEN 1.10

            ELSE 1.00

        END

    ,2) AS profit

FROM warehouse.vw_simulated_revenue_trend;