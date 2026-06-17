select
    trim(customer_id) as customer_id,
    trim(customer_unique_id) as customer_unique_id,
    safe_cast(customer_zip_code_prefix as int64) as customer_zip_code_prefix,
    lower(trim(customer_city)) as customer_city,
    upper(trim(customer_state)) as customer_state
from {{ source('Supabase_data', 'public_sb_customers_dataset') }}
where customer_id is not null

qualify row_number() over (
    partition by customer_id
    order by customer_id
) = 1
