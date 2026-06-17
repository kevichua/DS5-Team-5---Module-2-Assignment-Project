select
    count(*) as total_rows,

    countif(order_id is null) as null_order_id,
    countif(customer_id is null) as null_customer_id,
    countif(order_status is null) as null_order_status,
    countif(order_purchase_timestamp is null)
        as null_purchase_timestamp

from {{ source('Supabase_data','public_sb_orders_dataset') }}