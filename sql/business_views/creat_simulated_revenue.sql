CREATE OR REPLACE VIEW warehouse.vw_simulated_revenue_trend AS

SELECT

    year_number,
    month_number,
    month_name,

    CASE

        WHEN year_number = 2022
            THEN revenue

        WHEN year_number = 2023
            THEN revenue * 1.08

        WHEN year_number = 2024
            THEN revenue * 1.18

        WHEN year_number = 2025
            THEN revenue * 1.35

        ELSE revenue

    END AS adjusted_revenue,

    CASE

        WHEN year_number = 2022
            THEN profit

        WHEN year_number = 2023
            THEN profit * 1.08

        WHEN year_number = 2024
            THEN profit * 1.18

        WHEN year_number = 2025
            THEN profit * 1.35

        ELSE profit

    END AS adjusted_profit

FROM warehouse.vw_monthly_sales_trend;