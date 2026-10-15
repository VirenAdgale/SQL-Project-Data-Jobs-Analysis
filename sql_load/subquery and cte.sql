SELECT company_id,name as company_name FROM company_dim
WHERE company_id in (
    SELECT company_id from job_postings_fact
    where job_no_degree_mention=true
    ORDER BY company_id
);

WITH company_job_count as (
SELECT company_id,count(*) as total_jobs FROM job_postings_fact
GROUP BY company_id
)

SELECT company_dim.name,company_job_count.total_jobs FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id=company_dim.company_id
order BY total_jobs desc;