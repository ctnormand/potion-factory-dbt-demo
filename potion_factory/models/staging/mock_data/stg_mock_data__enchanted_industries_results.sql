with

source as (
    select * from {{ source('mock_data', 'enchanted_industries_results') }}
),

results as (
    select
        resultat as resulted_at,
        specid as external_sample_id,
        extid as sample_id,
        analysis as external_result_type,
        valueppm as result_value_ppm
    from source
)

select * from results
