select

    count(*) as total_rows,

    countif(product_id is null) as null_product_id,

    countif(product_category_name is null)
        as null_category,

    countif(product_weight_g is null)
        as null_weight,

    countif(product_length_cm is null)
        as null_length,

    countif(product_height_cm is null)
        as null_height,

    countif(product_width_cm is null)
        as null_width

from {{ source('Supabase_data','public_sb_products_dataset') }}