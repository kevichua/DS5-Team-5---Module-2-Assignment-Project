-- {{ config(materialized='table') }}

-- select
--     p.product_id,
--     p.product_category_name,
--     ct.product_category_name_english,
--     p.product_weight_g,
--     p.product_length_cm,
--     p.product_height_cm,
--     p.product_width_cm
-- from {{ ref('dv_products') }} p
-- left join {{ ref('dv_category_translation') }} ct
--     on p.product_category_name = ct.product_category_name


{{ config(materialized='table') }}

SELECT
    p.product_id,

    p.product_category_name AS category_name,

    COALESCE(
        ct.product_category_name_english,
        'unknown'
    ) AS category_name_english,

    p.product_name_length AS name_length,

    p.product_description_length AS description_length,

    p.product_photos_qty AS photos_qty,

    p.product_weight_g AS weight_g

FROM {{ ref('dv_products') }} p

LEFT JOIN {{ ref('dv_category_translation') }} ct
    ON p.product_category_name = ct.product_category_name