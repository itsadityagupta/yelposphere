with
    stg__tips_cte as (
        select business_id, user_id, date, text, compliment_count
        from {{ source("yelp", "stg_tips") }}
    )
select *
from stg__tips_cte
