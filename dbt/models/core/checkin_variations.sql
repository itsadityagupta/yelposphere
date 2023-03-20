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
    )
select day_of_week, hour, count(*) as no_of_checkins
from checkin_day_hours
group by day_of_week, hour
order by day_of_week, hour
