with businesses as (select * from {{ ref("stg__businesses") }})
select category, count(*) as category_count
from businesses, unnest(categories) as category
group by category
order by category_count desc
