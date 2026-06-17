select
    trim(seller_id) as seller_id,
    safe_cast(seller_zip_code_prefix as int64) as seller_zip_code_prefix,
    lower(trim(seller_city)) as seller_city,
    upper(trim(seller_state)) as seller_state
from {{ source('Supabase_data', 'public_sb_sellers_dataset') }}
where seller_id is not null

qualify row_number() over (
    partition by seller_id
    order by seller_id
) = 1