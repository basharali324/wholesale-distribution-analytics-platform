CREATE TABLE warehouse.dim_date (

    date_key INTEGER PRIMARY KEY,

    full_date DATE NOT NULL,

    day_number INTEGER,

    day_name VARCHAR(20),

    week_number INTEGER,

    month_number INTEGER,

    month_name VARCHAR(20),

    quarter_number INTEGER,

    year_number INTEGER,

    is_weekend BOOLEAN

);


INSERT INTO warehouse.dim_date (

    date_key,
    full_date,
    day_number,
    day_name,
    week_number,
    month_number,
    month_name,
    quarter_number,
    year_number,
    is_weekend

)

SELECT

    TO_CHAR(d,'YYYYMMDD')::INTEGER,

    d,

    EXTRACT(DAY FROM d),

    TO_CHAR(d,'Day'),

    EXTRACT(WEEK FROM d),

    EXTRACT(MONTH FROM d),

    TO_CHAR(d,'Month'),

    EXTRACT(QUARTER FROM d),

    EXTRACT(YEAR FROM d),

    CASE
        WHEN EXTRACT(ISODOW FROM d) IN (6,7)
        THEN TRUE
        ELSE FALSE
    END

FROM generate_series(

    DATE '2020-01-01',

    DATE '2030-12-31',

    INTERVAL '1 day'

) d;