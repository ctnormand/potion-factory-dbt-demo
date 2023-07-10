with

results as (
    select
        sample_id,
        result_type,
        result_value_ppm
    from {{ ref('results_fct') }}
),

samples as (
    select
        sample_id,
        date_trunc('hour', collected_at) as sample_hour
    from {{ ref('samples_dim') }}
    where sample_type = 3
),

sample_counts as (
    select
        sample_hour,
        count(*) as sample_count
    from samples
    group by sample_hour
),

results_by_hour as (
    select
        samples.sample_hour,
        results.result_type,
        results.result_value_ppm
    from samples
    inner join results on samples.sample_id = results.sample_id
),

pivoted as (
    pivot results_by_hour on lower(result_type) using avg(result_value_ppm) as ppm
)

select
    pivoted.sample_hour,
    sample_counts.sample_count,
    pivoted.fairy_dust_ppm,
    pivoted.magic_berries_ppm,
    pivoted.snake_venom_ppm
from pivoted
inner join sample_counts on sample_counts.sample_hour = pivoted.sample_hour
order by pivoted.sample_hour
