WITH top_paying_jobs as(
    SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    name as Company_name,
    job_posted_date
from job_postings_fact left JOIN company_dim on job_postings_fact.company_id=company_dim.company_id
where job_title_short='Data Analyst' and
      job_location='Anywhere' and
      salary_year_avg IS NOT NULL
      order BY salary_year_avg DESC
limit 10
)
SELECT top_paying_jobs.*,skills from top_paying_jobs
join skills_job_dim on skills_job_dim.job_id=top_paying_jobs.job_id
join skills_dim on skills_dim.skill_id=skills_job_dim.skill_id
order by salary_year_avg DESC;


