select
    order_status,
    count(*) as total_orders
from {{ source('Supabase_data', 'public_sb_orders_dataset') }}
group by order_status
order by total_orders desc