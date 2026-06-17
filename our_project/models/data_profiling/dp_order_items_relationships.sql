select
    count(*) as orphan_products
from {{ source('Supabase_data', 'public_sb_order_items_dataset') }} oi
left join {{ source('Supabase_data', 'public_sb_products_dataset') }} p
    on oi.product_id = p.product_id
where p.product_id is null