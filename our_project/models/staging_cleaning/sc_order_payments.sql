select
    trim(order_id) as order_id,
    safe_cast(payment_sequential as int64) as payment_sequential,
    lower(trim(payment_type)) as payment_type,
    safe_cast(payment_installments as int64) as payment_installments,
    safe_cast(payment_value as numeric) as payment_value
from {{ source('Supabase_data', 'public_sb_order_payments_dataset') }}
where order_id is not null
  and payment_sequential is not null
  and safe_cast(payment_value as numeric) >= 0
