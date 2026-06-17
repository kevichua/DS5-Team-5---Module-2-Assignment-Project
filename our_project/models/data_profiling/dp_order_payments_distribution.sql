select

    payment_type,
    count(*) as total

from {{ source('Supabase_data','public_sb_order_payments_dataset') }}

group by payment_type
order by total desc