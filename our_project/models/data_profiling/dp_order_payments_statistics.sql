select
    min(payment_value) as min_payment,
    max(payment_value) as max_payment,
    avg(payment_value) as avg_payment,
    countif(payment_value < 0) as negative_payment
from {{ source('Supabase_data','public_sb_order_payments_dataset') }}