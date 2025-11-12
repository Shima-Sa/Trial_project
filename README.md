### This is my rebuild project
https://github.com/shimasaberianpour1375-gif/Trial_project
## Project links
- [Looker Studio Dashboard](https://lookerstudio.google.com/s/icf5w4u70h8)
- [BigQuery Project](https://console.cloud.google.com/bigquery?ws=!1m4!1m3!3m2!1snotional-gist-474313-e1!2sdbt_shimasaberianpour1375)
- [Google Document ](https://docs.google.com/document/d/10gjeLOtjLAX8jtwaD_nsiGkv81DkPkxBL7Ez9uqTY_k/edit?usp=sharing)

### Stack Overflow Trending and Unanswered Tags Analysis
This is an end-to-end mini analytics project using the Stack Overflow public dataset in BigQuery.
The goal is to identify trending topics with low answer rates, which can highlight areas where developers face challenges or where community engagement and technical documentation could be improved.
### Data 
Source: bigquery-public-data.stackoverflow.posts_questions
The dataset was filtered to include questions from 2020 to 2022, allowing comparison of trends and answer rates over time. This period helps identify the latest topics gaining attention while revealing subjects with consistently low response levels.

### Architecture
<img width="940" height="375" alt="image" src="https://github.com/user-attachments/assets/1c3a6ffd-abe8-4e2f-a0d2-4171b6fa3cf5" />

In this project:
* STG (staging): models clean and standardize raw data from BigQuery sources.  
* INT (intermediate): models aggregate and transform the staging outputs to prepare them for analysis in the final fact and dimension tables.  

 A star schema model was designed with:

* agg_tag_week_trends as the fact table

* dim_tag and dim_time as dimension tables
This simple model structure supports scalability and clear analysis in visualization tools.
It enables weekly trend analysis per tag, showing how engagement changes over time.

### Data quality
Data quality checks were applied to ensure accuracy and integrity:

* Non-null validation for all metrics in fact and dimension tables

* Uniqueness checks on dim_tag.tag_name and dim_time.week_start

These steps helped maintain consistency across data sources and prevented duplication or missing values during transformation.

### Looker Studio
The main visualization is built on dbt_shima.agg_tag_week_trends,
joined with dim_time on week_start to include year and month.
A filter was applied to show tags with more than 1100 total questions, improving the clarity of insights by focusing on high-volume topics.
The unanswered rate metric was used to visualize areas with lower community engagement.


<img width="389" height="614" alt="image" src="https://github.com/user-attachments/assets/a25a9296-957c-4d87-bf55-c6b42f4558fa" />


Two bar charts compare the most frequent tags and unanswered tags.
The overlap shows that highly popular topics like Python, JavaScript, Java, and ReactJS also have high volumes of unanswered questions, suggesting fast-growing but complex areas of discussion.

<img width="504" height="326" alt="image" src="https://github.com/user-attachments/assets/fdaad128-2781-43cd-8577-1131f60f0be2" />

Another chart visualizes top tags by weighted unanswered rate (2020–2022).
Tags such as Android, Java, NodeJS, and ReactJS show unanswered rates above 60%, indicating potential focus areas for community contributors or technical documentation improvements.

### Insights
* Even the most used technologies still have large unanswered gaps, showing where developers might be struggling and where better support or clearer documentation could help.

* Weighted unanswered rate provides a stronger metric than raw counts for identifying “at-risk” topics.

* Future work could include time-series forecasting of unanswered trends or topic clustering to group related tags by unanswered behavior.
