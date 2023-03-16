{{
    config(
        partition_by={
            "field": "is_open",
            "data_type": "int64",
            "range": {"start": 0, "end": 2, "interval": 1},
        }
    )
}}
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
            if(
                categories is null or categories = '',
                null,
                array(
                    select trim(category)
                    from unnest(split(categories, ',')) as category
                )
            ) as categories
        from {{ source("yelp", "stg_businesses") }}
    )
select *
from stg__businesses_cte
