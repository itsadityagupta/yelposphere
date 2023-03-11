with stg__checkins_cte as (
    SELECT
        business_id,
        date
    FROM {{ source('yelp', 'stg_checkin') }}
)

SELECT *
FROM stg__checkins_cte