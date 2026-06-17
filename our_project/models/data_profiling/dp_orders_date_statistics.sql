select
    min(order_purchase_timestamp) as min_purchase_date,
    max(order_purchase_timestamp) as max_purchase_date,

    min(order_approved_at) as min_approved_date,
    max(order_approved_at) as max_approved_date,

    min(order_delivered_customer_date) as min_delivered_date,
    max(order_delivered_customer_date) as max_delivered_date
from {{ source('Supabase_data','public_sb_orders_dataset') }}