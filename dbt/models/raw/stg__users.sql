WITH stg__users_cte AS (
  SELECT
    user_id,
    name,
    review_count,
    to_timestamp(yelping_since) AS yelping_since,
    useful,
    funny,
    cool,
    fans,
    average_stars
  FROM
    {{ source('yelp', 'users') }}
)

SELECT *
FROM stg__users_cte;