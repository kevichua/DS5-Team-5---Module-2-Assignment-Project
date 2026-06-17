select
    count(*) as total_rows,

    countif(order_id is null) as null_order_id,
    countif(product_id is null) as null_product_id,
    countif(seller_id is null) as null_seller_id,
    countif(price is null) as null_price,
    countif(freight_value is null) as null_freight_value

from {{ source('Supabase_data','public_sb_order_items_dataset') }}