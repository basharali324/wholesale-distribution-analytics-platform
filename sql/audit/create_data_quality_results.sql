/*
Purpose:
Store data quality check outcomes.
*/

CREATE TABLE IF NOT EXISTS audit.data_quality_results
(
    result_id BIGSERIAL PRIMARY KEY,

    check_name VARCHAR(100) NOT NULL,

    check_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    records_checked BIGINT,

    failed_records BIGINT,

    status VARCHAR(20),

    notes TEXT
);