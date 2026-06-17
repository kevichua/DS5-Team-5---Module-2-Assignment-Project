select

    count(*) as total_rows,

    countif(review_id is null) as null_review_id,
    countif(order_id is null) as null_order_id,
    countif(review_score is null) as null_review_score

from {{ source('Supabase_data','public_sb_order_reviews_dataset') }}