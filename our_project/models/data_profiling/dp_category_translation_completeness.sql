select

    count(*) as total_rows,

    countif(product_category_name is null)
        as null_category_name,

    countif(product_category_name_english is null)
        as null_category_name_english

from {{ source('Supabase_data','public_sb_product_category_name_translation') }}