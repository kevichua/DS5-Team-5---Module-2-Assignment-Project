select
    seller_id,
    count(*) as duplicate_count
from {{ source('Supabase_data','public_sb_sellers_dataset') }}
group by seller_id
having count(*) > 1