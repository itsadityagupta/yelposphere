with
    stg__checkins_cte as (
        select business_id, date from {{ source("yelp", "stg_checkin") }}
    )

select *
from stg__checkins_cte
