SELECT
    '03-10-2026' ::DATE,
    'True' ::BOOLEAN;

select  
    job_title_short as title,
    job_location as location,
    job_posted_date ::DATE as DATE from job_postings_fact;

select  
    job_title_short as title,
    job_location as location,
    job_posted_date AT TIME ZONE 'UTC' --AT TIME ZONE 'EST'
     from job_postings_fact
LIMIT 10;

select  * 
    from job_postings_fact
    WHERE EXTRACT(MONTH from job_posted_date) =1
LIMIT 10;



CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;


-- February
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;


-- March
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

select job_posted_date from march_jobs;