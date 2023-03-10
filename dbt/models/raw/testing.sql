with cte as (select * from {{ source("staging", "green_taxi") }}) select * from cte
