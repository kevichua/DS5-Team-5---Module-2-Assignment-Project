select
    product_category_name,
    count(*) as total
from {{ source('Supabase_data','public_sb_products_dataset') }}
group by product_category_name
order by total desc