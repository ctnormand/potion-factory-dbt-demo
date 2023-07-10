with

shipments as (
    select * from {{ ref('stg_mock_data__shipments') }}
)

select * from shipments
order by sample_id
