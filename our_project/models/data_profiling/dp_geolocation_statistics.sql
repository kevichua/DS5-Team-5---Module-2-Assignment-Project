select

    min(geolocation_lat) as min_lat,
    max(geolocation_lat) as max_lat,

    min(geolocation_lng) as min_lng,
    max(geolocation_lng) as max_lng,

    countif(
        geolocation_lat not between -34 and 6
    ) as invalid_latitude,

    countif(
        geolocation_lng not between -75 and -30
    ) as invalid_longitude

from {{ source('Supabase_data','public_sb_geolocation_dataset') }}