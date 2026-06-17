select
    product_id,
    count(*) as duplicate_count
from {{ source('Supabase_data','public_sb_products_dataset') }}
group by product_id
having count(*) > 1