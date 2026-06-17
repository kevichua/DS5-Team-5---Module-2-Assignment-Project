{{ config(materialized='table') }}

select
    p.product_id,
    p.product_category_name,
    ct.product_category_name_english,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
from {{ ref('dv_products') }} p
left join {{ ref('dv_category_translation') }} ct
    on p.product_category_name = ct.product_category_name