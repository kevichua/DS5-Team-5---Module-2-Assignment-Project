{{ config(materialized='table') }}

with dates as (

    select distinct
        date(order_purchase_timestamp) as date_day
    from {{ ref('dv_orders') }}

)

select
    date_day,

    extract(year from date_day) as year,
    extract(quarter from date_day) as quarter,
    extract(month from date_day) as month,
    extract(day from date_day) as day,

    format_date('%B', date_day) as month_name,
    format_date('%A', date_day) as day_name

from dates