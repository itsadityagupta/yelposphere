with
    stg__checkins_cte as (
        select business_id, date from {{ source("yelp", "stg_checkin") }}
    )
select
    business_id,
    if(
        date is null or date = '',
        null,
        array(select timestamp(trim(d)) from unnest(split(date, ',')) as d)
    ) as checkin_dates
from stg__checkins_cte
