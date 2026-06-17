-- {{ config(materialized='table') }}

-- select

--     o.order_id,

--     o.customer_id,

--     date(o.order_purchase_timestamp) as order_date,

--     o.order_status,

--     count(distinct oi.order_item_id) as total_items,

--     sum(oi.price) as total_product_value,

--     sum(oi.freight_value) as total_freight_value,

--     sum(op.payment_value) as total_payment_value,

--     avg(r.review_score) as avg_review_score

-- from {{ ref('dv_orders') }} o

-- left join {{ ref('dv_order_items') }} oi
--     on o.order_id = oi.order_id

-- left join {{ ref('dv_order_payments') }} op
--     on o.order_id = op.order_id

-- left join {{ ref('dv_order_reviews') }} r
--     on o.order_id = r.order_id

-- group by
--     o.order_id,
--     o.customer_id,
--     order_date,
--     o.order_status

{{ config(materialized='table') }}

WITH latest_review AS (

    SELECT
        order_id,
        review_score
    FROM {{ ref('dv_order_reviews') }}

    QUALIFY ROW_NUMBER() OVER (
        PARTITION BY order_id
        ORDER BY review_answer_timestamp DESC
    ) = 1

),

payment_totals AS (

    SELECT
        order_id,
        SUM(payment_value) AS total_payment_value
    FROM {{ ref('dv_order_payments') }}
    GROUP BY order_id

)

SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    DATE(o.order_purchase_timestamp) AS purchase_date,

    DATE_DIFF(
        DATE(o.order_delivered_customer_date),
        DATE(o.order_purchase_timestamp),
        DAY
    ) AS delivery_days,

    DATE_DIFF(
        DATE(o.order_estimated_delivery_date),
        DATE(o.order_purchase_timestamp),
        DAY
    ) AS estimated_delivery_days,

    r.review_score,
    p.total_payment_value

FROM {{ ref('dv_orders') }} o

LEFT JOIN latest_review r
    ON o.order_id = r.order_id

LEFT JOIN payment_totals p
    ON o.order_id = p.order_id