select
    trim(order_id) as order_id,
    safe_cast(order_item_id as int64) as order_item_id,
    trim(product_id) as product_id,
    trim(seller_id) as seller_id,
    safe_cast(shipping_limit_date as timestamp) as shipping_limit_date,
    safe_cast(price as numeric) as price,
    safe_cast(freight_value as numeric) as freight_value
from {{ source('Supabase_data', 'public_sb_order_items_dataset') }}
where order_id is not null