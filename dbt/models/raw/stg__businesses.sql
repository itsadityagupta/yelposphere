with
    stg__businesses_cte as (
        select
            business_id,
            name,
            address,
            city,
            state,
            postal_code,
            latitude,
            longitude,
            stars,
            review_count,
            is_open,
            categories
        from {{ source("yelp", "stg_businesses") }}
    )

select *
from stg__businesses_cte
