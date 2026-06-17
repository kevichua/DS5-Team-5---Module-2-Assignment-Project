select
    order_id,
    count(*) as duplicate_count
from {{ source('Supabase_data','public_sb_orders_dataset') }}
group by order_id
having count(*) > 1