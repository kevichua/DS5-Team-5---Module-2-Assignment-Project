select

    min(price) as min_price,
    max(price) as max_price,
    avg(price) as avg_price,

    min(freight_value) as min_freight,
    max(freight_value) as max_freight,
    avg(freight_value) as avg_freight,

    countif(price < 0) as negative_price,
    countif(freight_value < 0) as negative_freight

from {{ source('Supabase_data','public_sb_order_items_dataset') }}