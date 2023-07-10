with

source as (
    select * from {{ source('mock_data', 'shipments') }}
),

shipments as (
    select
        sample_id,
        shipped_at,
        lab_name
    from source
)

select * from shipments
