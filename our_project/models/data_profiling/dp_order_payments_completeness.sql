select

    count(*) as total_rows,

    countif(order_id is null) as null_order_id,
    countif(payment_type is null) as null_payment_type,
    countif(payment_value is null) as null_payment_value

from {{ source('Supabase_data','public_sb_order_payments_dataset') }}