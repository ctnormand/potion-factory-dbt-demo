with

shipments as (
    select
        sample_id,
        lab_name,
        shipped_at
    from {{ ref('shipments_fct') }}
),

results as (
    select
        sample_id,
        resulted_at
    from {{ ref('results_fct') }}
),

turnaround_time as (
    select
        shipments.lab_name,
        date_diff(
            'hour', shipments.shipped_at, results.resulted_at
        ) as turnaround_hours
    from shipments
    inner join results on results.sample_id = shipments.sample_id
)

select
    lab_name,
    round(avg(turnaround_hours) / 24, 2) as average_turnaround_days
from turnaround_time
group by lab_name
order by average_turnaround_days desc
