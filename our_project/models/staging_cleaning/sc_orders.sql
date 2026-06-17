select
    trim(order_id) as order_id,
    trim(customer_id) as customer_id,
    lower(trim(order_status)) as order_status,
    safe_cast(order_purchase_timestamp as timestamp) as order_purchase_timestamp,
    safe_cast(order_approved_at as timestamp) as order_approved_at,
    safe_cast(order_delivered_carrier_date as timestamp) as order_delivered_carrier_date,
    safe_cast(order_delivered_customer_date as timestamp) as order_delivered_customer_date,
    safe_cast(order_estimated_delivery_date as timestamp) as order_estimated_delivery_date
from {{ source('Supabase_data', 'public_sb_orders_dataset') }}
where order_id is not null

qualify row_number() over (
    partition by order_id
    order by order_purchase_timestamp desc
) = 1
