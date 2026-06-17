{{ config(materialized='table') }}

select

    o.order_id,

    o.customer_id,

    date(o.order_purchase_timestamp) as order_date,

    o.order_status,

    count(distinct oi.order_item_id) as total_items,

    sum(oi.price) as total_product_value,

    sum(oi.freight_value) as total_freight_value,

    sum(op.payment_value) as total_payment_value,

    avg(r.review_score) as avg_review_score

from {{ ref('dv_orders') }} o

left join {{ ref('dv_order_items') }} oi
    on o.order_id = oi.order_id

left join {{ ref('dv_order_payments') }} op
    on o.order_id = op.order_id

left join {{ ref('dv_order_reviews') }} r
    on o.order_id = r.order_id

group by
    o.order_id,
    o.customer_id,
    order_date,
    o.order_status