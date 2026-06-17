select
    customer_id,
    count(*) as duplicate_count
from {{ source('Supabase_data','public_sb_customers_dataset') }}
group by customer_id
having count(*) > 1