select

    count(*) as total_rows,

    countif(geolocation_zip_code_prefix is null)
        as null_zip_code,

    countif(geolocation_lat is null)
        as null_lat,

    countif(geolocation_lng is null)
        as null_lng,

    countif(geolocation_city is null)
        as null_city,

    countif(geolocation_state is null)
        as null_state

from {{ source('Supabase_data','public_sb_geolocation_dataset') }}