-- {{ config(materialized='table') }}

-- select
--     seller_id,
--     seller_zip_code_prefix,
--     seller_city,
--     seller_state
-- from {{ ref('dv_sellers') }}


{{ config(materialized='table') }}

SELECT
    seller_id,

    seller_city AS city,

    seller_state AS state,

    seller_zip_code_prefix AS zip_code_prefix

FROM {{ ref('dv_sellers') }}
