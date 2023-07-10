with

samples as (
    select * from {{ ref('stg_mock_data__samples') }}
)

select * from samples
order by sample_id
