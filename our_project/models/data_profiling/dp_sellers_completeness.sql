select

    count(*) as total_rows,

    countif(seller_id is null) as null_seller_id,

    countif(seller_zip_code_prefix is null)
        as null_zip_code,

    countif(seller_city is null)
        as null_city,

    countif(seller_state is null)
        as null_state

from {{ source('Supabase_data','public_sb_sellers_dataset') }}