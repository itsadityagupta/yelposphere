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
                    from unnest(split(categories, ';')) as category
                )
            ) as category_array,
            categories
        from {{ source("yelp", "stg_businesses") }}
    )

select *
from stg__businesses_cte
