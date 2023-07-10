with

results as (
    select * from {{ ref('stg_mock_data__enchanted_industries_results') }}
),

result_map as (
    select * from {{ ref('enchanted_industries_result_map') }}
)

select
    results.sample_id,
    result_map.internal_result_type as result_type,
    results.result_value_ppm,
    'Enchanted Industries' as lab_name,
    results.external_sample_id,
    results.resulted_at
from results
left join
    result_map
    on results.external_result_type = result_map.external_result_type
