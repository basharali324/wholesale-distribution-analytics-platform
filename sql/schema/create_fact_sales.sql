CREATE TABLE warehouse.fact_sales (

    sales_key BIGSERIAL PRIMARY KEY,

    date_key INTEGER,

    customer_key BIGINT,

    product_key BIGINT,

    warehouse_key BIGINT,

    order_id VARCHAR(20),

    order_line_id VARCHAR(20),

    quantity INTEGER,

    unit_price NUMERIC(10,2),

    unit_cost NUMERIC(10,2),

    revenue NUMERIC(12,2),

    cost NUMERIC(12,2),

    profit NUMERIC(12,2),

    discount_pct NUMERIC(5,2)

);

