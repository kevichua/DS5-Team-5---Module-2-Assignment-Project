select
    trim(product_category_name) as product_category_name,
    trim(product_category_name_english) as product_category_name_english
from {{ source('Supabase_data', 'public_sb_product_category_name_translation') }}
where product_category_name is not null

qualify row_number() over (
    partition by product_category_name
    order by product_category_name
) = 1
