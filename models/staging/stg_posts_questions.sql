{{ config(materialized='view') }}

select
  id as question_id,
  creation_date as created_at,
  answer_count,
  accepted_answer_id,
  split(tags, '|') as tags_array
from `bigquery-public-data.stackoverflow.posts_questions`
where tags is not null and trim(tags) != ''
