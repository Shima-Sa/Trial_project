{{ config(materialized='view') }}

with weeks as (
  select distinct
    date_trunc(date(created_at), isoweek) as week_start
  from {{ ref('int_question_tags') }}
)
select
  week_start,
  date_trunc(week_start, month)                    as month_start,
  extract(year  from week_start)                   as year,
  extract(month from week_start)                   as month_number,
  format_date('%B', date_trunc(week_start, month)) as month_name,
  extract(isoweek from week_start)                 as week_number
from weeks
