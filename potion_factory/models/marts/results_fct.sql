with

enchanted_industries_results as (
    select * from {{ ref('int_enchanted_industries_results_mapped') }}
),

toadstool_labs_results as (
    select * from {{ ref('int_toadstool_labs_results_mapped') }}
),

results as (
    select * from enchanted_industries_results
    union
    select * from toadstool_labs_results
)

select * from results
order by sample_id
