{{ config(materialized='table') }}

select
  tag_name,
  date_trunc(date(created_at), isoweek) as week_start,
  count(*) as total_questions,
  countif(answer_count > 0) as answered_questions,
  countif(accepted_answer_id is not null) as accepted_questions,
  countif(answer_count = 0 or accepted_answer_id is null) as unanswered_questions,
  safe_divide(
    countif(answer_count = 0 or accepted_answer_id is null),
    count(*)
  ) as unanswered_rate
from {{ ref('int_question_tags') }}
group by 1, 2
