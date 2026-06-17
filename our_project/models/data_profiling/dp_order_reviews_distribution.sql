select

    review_score,
    count(*) as total

from {{ source('Supabase_data','public_sb_order_reviews_dataset') }}

group by review_score
order by review_score