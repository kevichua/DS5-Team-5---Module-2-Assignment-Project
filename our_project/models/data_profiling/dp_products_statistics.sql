select

    min(product_weight_g) as min_weight,
    max(product_weight_g) as max_weight,
    avg(product_weight_g) as avg_weight,

    min(product_length_cm) as min_length,
    max(product_length_cm) as max_length,

    min(product_height_cm) as min_height,
    max(product_height_cm) as max_height,

    min(product_width_cm) as min_width,
    max(product_width_cm) as max_width

from {{ source('Supabase_data','public_sb_products_dataset') }}