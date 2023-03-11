with
    stg__reviews_cte as (
        select review_id, user_id, business_id, stars, cool, date, funny, useful, text
        from {{ source("yelp", "stg_reviews") }}
    )

select *
from stg__reviews_cte
