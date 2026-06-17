{{ config(materialized='table') }}

select

    oi.order_id,

    oi.order_item_id,

    o.customer_id,

    oi.product_id,

    oi.seller_id,

    date(o.order_purchase_timestamp) as order_date,

    o.order_status,

    oi.price,

    oi.freight_value,

    (oi.price + oi.freight_value) as total_item_value

from {{ ref('dv_order_items') }} oi

inner join {{ ref('dv_orders') }} o
    on oi.order_id = o.order_id