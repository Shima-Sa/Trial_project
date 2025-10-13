{{ config(materialized='view') }}
select distinct tag_name
from {{ ref('int_question_tags') }}
