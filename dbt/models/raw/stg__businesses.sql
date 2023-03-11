WITH stg__businesses_cte AS (
    SELECT
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
    FROM {{ source('yelp', 'stg_businesses') }}
)

SELECT *
FROM stg__businesses_cte
