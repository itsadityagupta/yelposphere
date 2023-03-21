with
    checkins as (select * from {{ ref("stg__checkins") }}),
    checkin_dates as (
        select checkins from checkins c, unnest(c.checkin_dates) as checkins
    ),
    checkin_day_hours as (
        select
            extract(hour from checkins) as hour,
            -- [1-7] where 1 is Sunday
            extract(dayofweek from checkins) as day_of_week,
        from checkin_dates
    ),
    variations as (
        select day_of_week, hour, count(*) as no_of_checkins
        from checkin_day_hours
        group by day_of_week, hour
        order by day_of_week, hour
    )
select
    case day_of_week
        WHEN 1 THEN 'Sunday'
        WHEN 2 THEN 'Monday'
        WHEN 3 THEN 'Tuesday'
        WHEN 4 THEN 'Wednesday'
        WHEN 5 THEN 'Thursday'
        WHEN 6 THEN 'Friday'
        WHEN 7 THEN 'Saturday'
    end as day_of_week,
    hour,
    no_of_checkins
from variations
