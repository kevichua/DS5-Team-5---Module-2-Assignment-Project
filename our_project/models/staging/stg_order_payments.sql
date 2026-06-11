SELECT
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    CAST(payment_value AS FLOAT64) AS payment_value
FROM {{ source('Supabase_data', 'public_sb_order_payments_dataset') }}
