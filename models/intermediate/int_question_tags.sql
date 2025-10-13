{{ config(materialized='view') }}

with base as (
  select
    question_id,
    created_at,
    answer_count,
    accepted_answer_id,
    tags_array
  from {{ ref('stg_posts_questions') }}
  where extract(year from created_at) between 2020 and 2022
)
select
  question_id,
  created_at,
  answer_count,
  accepted_answer_id,
  tag as tag_name
from base CROSS JOIN unnest(tags_array) as tag
