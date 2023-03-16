with
    stg__users_cte as (
        select
            user_id,
            name,
            review_count,
            timestamp(yelping_since) as yelping_since,
            useful,
            funny,
            cool,
            fans,
            average_stars
        from {{ source("yelp", "stg_users") }}
    )
select *
from stg__users_cte