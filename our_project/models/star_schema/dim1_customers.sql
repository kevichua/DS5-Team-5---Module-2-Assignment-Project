-- {{ config(materialized='table') }}

-- select
--     customer_id,
--     customer_unique_id,
--     customer_zip_code_prefix,
--     customer_city,
--     customer_state
-- from {{ ref('dv_customers') }}


{{ config(materialized='table') }}

SELECT
    c.customer_id,
    c.customer_unique_id,
    c.customer_city AS city,
    c.customer_state AS state,
    c.customer_zip_code_prefix AS zip_code_prefix

FROM {{ ref('dv_customers') }} c
