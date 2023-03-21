with businesses as (select * from {{ ref("stg__businesses") }})
select city, count(*) as no_of_businesses
from businesses
group by city
order by no_of_businesses desc
