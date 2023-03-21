with
    reviews as (select * from {{ ref("stg__reviews") }}),
    businesses as (select * from {{ ref("stg__businesses") }}),
    five_star_reviewed as (
        select business_id, count(*) as no_of_five_star_reviews
        from reviews
        where stars = 5
        group by business_id
    )
select b.name, f.no_of_five_star_reviews
from five_star_reviewed f
join businesses b on f.business_id = b.business_id
order by f.no_of_five_star_reviews desc
