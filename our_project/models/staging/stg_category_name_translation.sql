SELECT
    product_category_name,
    product_category_name_english AS category_name_english
FROM {{ source('Supabase_data', 'public_sb_product_category_name_translation') }}
