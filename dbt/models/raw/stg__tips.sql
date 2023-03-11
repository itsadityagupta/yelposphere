WITH stg__tips_cte AS (
  SELECT
    business_id,
    user_id,
    date,
    text,
    compliment_count
  FROM {{ source('yelp', 'stg__tips') }}
)
SELECT *
FROM stg__tips_cte