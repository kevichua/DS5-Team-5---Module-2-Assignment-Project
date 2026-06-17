select
    trim(review_id) as review_id,
    trim(order_id) as order_id,
    safe_cast(review_score as int64) as review_score,
    trim(review_comment_title) as review_comment_title,
    trim(review_comment_message) as review_comment_message,
    safe_cast(review_creation_date as timestamp) as review_creation_date,
    safe_cast(review_answer_timestamp as timestamp) as review_answer_timestamp
from {{ source('Supabase_data', 'public_sb_order_reviews_dataset') }}
where review_id is not null
