select
    count(*) as total_rows,
    count(distinct customer_id) as distinct_customer_id,

    countif(customer_id is null) as null_customer_id,
    countif(customer_unique_id is null) as null_customer_unique_id,
    countif(customer_zip_code_prefix is null) as null_zip_code,
    countif(customer_city is null) as null_city,
    countif(customer_state is null) as null_state

from {{ source('Supabase_data','public_sb_customers_dataset') }}