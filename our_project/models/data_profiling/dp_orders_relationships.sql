select
    count(*) as orphan_orders
from {{ source('Supabase_data', 'public_sb_orders_dataset') }} o
left join {{ source('Supabase_data', 'public_sb_customers_dataset') }} c
    on o.customer_id = c.customer_id
where c.customer_id is null