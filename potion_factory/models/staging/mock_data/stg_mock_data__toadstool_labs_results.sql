with

source as (
    select * from {{ source('mock_data', 'toadstool_labs_results') }}
),

results as (
    select
        internal_specimen_id as external_sample_id,
        external_specimen_id as sample_id,
        result_time as resulted_at,
        test_type as external_result_type,
        result_value as result_value_ppm
    from source
)

select * from results
