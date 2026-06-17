-- {{ config(materialized='table') }}

-- select

--     oi.order_id,

--     oi.order_item_id,

--     o.customer_id,

--     oi.product_id,

--     oi.seller_id,

--     date(o.order_purchase_timestamp) as order_date,

--     o.order_status,

--     oi.price,

--     oi.freight_value,

--     (oi.price + oi.freight_value) as total_item_value

-- from {{ ref('dv_order_items') }} oi

-- inner join {{ ref('dv_orders') }} o
--     on oi.order_id = o.order_id


{{ config(materialized='table') }}

SELECT
    i.order_id,
    i.order_item_id,
    i.product_id,
    i.seller_id,
    o.customer_id,

    DATE(o.order_purchase_timestamp) AS purchase_date,

    i.price,
    i.freight_value,
    i.price + i.freight_value AS total_item_cost

FROM {{ ref('dv_order_items') }} i

INNER JOIN {{ ref('dv_orders') }} o
    ON i.order_id = o.order_id