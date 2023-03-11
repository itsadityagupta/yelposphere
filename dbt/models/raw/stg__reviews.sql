WITH stg__reviews_cte AS (
    SELECT
        review_id,
        user_id,
        business_id,
        stars,
        cool,
        date,
        funny,
        useful,
        text
    FROM {{ source('yelp', 'stg_reviews') }}
)

SELECT *
FROM stg__reviews_cte
