select
    safe_cast(geolocation_zip_code_prefix as int64) as geolocation_zip_code_prefix,
    avg(safe_cast(geolocation_lat as float64)) as geolocation_lat,
    avg(safe_cast(geolocation_lng as float64)) as geolocation_lng,
    lower(trim(any_value(geolocation_city))) as geolocation_city,
    upper(trim(any_value(geolocation_state))) as geolocation_state
from {{ source('Supabase_data', 'public_sb_geolocation_dataset') }}
where geolocation_zip_code_prefix is not null
  and safe_cast(geolocation_lat as float64) between -34 and 6
  and safe_cast(geolocation_lng as float64) between -75 and -30
group by geolocation_zip_code_prefix
