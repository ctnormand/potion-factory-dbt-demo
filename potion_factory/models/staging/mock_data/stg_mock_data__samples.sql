with

source as (
    select * from {{ source('mock_data', 'samples') }}
),

samples as (
    select
        sample_id,
        sample_type,
        collected_at,
        volume_ml
    from source
)

select * from samples
