/*
Purpose:
Track ETL execution history.

Author:
Mubasher Ali
*/

CREATE TABLE IF NOT EXISTS audit.etl_run_log
(
    run_id BIGSERIAL PRIMARY KEY,

    process_name VARCHAR(100) NOT NULL,

    start_time TIMESTAMP NOT NULL,

    end_time TIMESTAMP,

    rows_loaded BIGINT,

    status VARCHAR(20),

    error_message TEXT,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);