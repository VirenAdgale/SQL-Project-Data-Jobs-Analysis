SELECT count(job_id) as no_of_jobs,
    case
        when job_location ='Anywhere' then 'remote'
        when job_location ='New York, NY' then 'local'
        else 'onsite'
    end as location_category
from job_postings_fact
where job_title_short='Data Analyst'
GROUP BY location_category;