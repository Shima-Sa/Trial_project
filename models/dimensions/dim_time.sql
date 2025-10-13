{{ config(materialized='view') }}

select distinct
  date_trunc(date(created_at), isoweek) as week_start,
  date_trunc(date(created_at), month)   as month_start,
  extract(year  from created_at)        as year,
  extract(month from created_at)        as month_number,
  format_date('%B', date_trunc(date(created_at), month)) as month_name,
  extract(week  from created_at)        as week_number
from {{ ref('int_question_tags') }}
