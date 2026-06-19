CREATE TABLE warehouse.dim_customer (

    customer_key BIGSERIAL PRIMARY KEY,

    customer_id VARCHAR(20) UNIQUE,

    customer_name VARCHAR(255),

    customer_type VARCHAR(100),

    region VARCHAR(100),

    city VARCHAR(100),

    postcode VARCHAR(20),

    account_manager VARCHAR(255),

    created_date DATE,

    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

INSERT INTO warehouse.dim_customer (

    customer_id,
    customer_name,
    customer_type,
    region,
    city,
    postcode,
    account_manager,
    created_date

)

SELECT

    customer_id,
    customer_name,
    customer_type,
    region,
    city,
    postcode,
    account_manager,
    created_date

FROM staging.customers;



CREATE TABLE warehouse.dim_product (

    product_key BIGSERIAL PRIMARY KEY,

    product_id VARCHAR(20) UNIQUE,

    product_name VARCHAR(255),

    category VARCHAR(100),

    subcategory VARCHAR(100),

    brand VARCHAR(255),

    supplier_id VARCHAR(20),

    unit_cost NUMERIC(10,2),

    unit_price NUMERIC(10,2),

    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);


insert into warehouse.dim_product (

    product_id,
    product_name,
    category,
    subcategory,
    brand,
    supplier_id,
    unit_cost,
    unit_price

)
select  

    product_id,
    product_name,
    category,
    subcategory,
    brand,
    supplier_id,
    unit_cost,
    unit_price
from staging.products;


create table warehouse.dim_supplier (

    supplier_key BIGSERIAL PRIMARY KEY,

    supplier_id VARCHAR(20) UNIQUE,

    supplier_name VARCHAR(255),

    country VARCHAR(100),

    supplier_type VARCHAR(100),

    lead_time_days INTEGER,

    rating NUMERIC(3,1),

    created_date DATE,

    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

insert into warehouse.dim_supplier (

    supplier_id,
    supplier_name,
    country,
    supplier_type,
    lead_time_days,
    rating,
    created_date

)
select  

    supplier_id,
    supplier_name,
    country,
    supplier_type,
    lead_time_days,
    rating,
    created_date
from staging.suppliers;



create table warehouse.dim_warehouse (

    warehouse_key BIGSERIAL PRIMARY KEY,

    warehouse_id VARCHAR(20) UNIQUE,

    warehouse_name VARCHAR(255),

    region VARCHAR(100),

    capacity INTEGER,

    load_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);      

insert into warehouse.dim_warehouse (

    warehouse_id,
    warehouse_name,
    region,
    capacity

)
select  

    warehouse_id,
    warehouse_name,
    region,
    capacity
from staging.warehouses;