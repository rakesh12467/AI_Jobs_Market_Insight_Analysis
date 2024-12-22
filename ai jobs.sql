SELECT * FROM jobs.`ai jobs`;
use jobs;

-- 1. count job titles
select distinct count(*) as job_titles
from jobs.`ai jobs`;

-- 2. average  salary as per company size
select Company_Size,avg(Salary_USD) 
from jobs.`ai jobs`
group by  Company_Size
limit 3;

-- 3. min 3 salary as per job title
SELECT*
FROM jobs.`ai jobs`
order by salary_USD asc
limit 3;

-- 4. max 3 salary as per job title
SELECT*
FROM jobs.`ai jobs`
order by salary_USD DESC
limit 3;

-- 5. no of job titles in dubai
select Job_Title
from   jobs.`ai jobs`
where Location='dubai';

-- 6.no. of jobs in medium level
select count(AI_Adoption_Level) as job_titles
from jobs.`ai jobs`
WHERE AI_Adoption_Level='MEDIUM';

-- 7.no. of jobs in low level
select count(AI_Adoption_Level) as job_titles
from jobs.`ai jobs`
WHERE AI_Adoption_Level='low';

-- 8. no. of jobs in high level
select count(AI_Adoption_Level) as job_titles
from jobs.`ai jobs`
WHERE AI_Adoption_Level='high';

SELECT
Salary_USD,
SUM(CASE WHEN salary_USD BETWEEN 0 AND 19999 THEN 1 ELSE 0 END) AS 'PRICE BELOW 20K',
SUM(CASE WHEN salary_USD BETWEEN 20000 AND 39999 THEN 1 ELSE 0 END) AS 'PRICE BETWEEN 20-40K',
SUM(CASE WHEN salary_USD BETWEEN 40000 AND 69999 THEN 1 ELSE 0 END) AS 'PRICE BETWEEN 40-60K',
SUM(CASE WHEN salary_USD BETWEEN 70000 AND 89999 THEN 1 ELSE 0 END) AS 'PRICE BETWEEN 60-80K',
SUM(CASE WHEN salary_USD BETWEEN 90000 AND 99999 THEN 1 ELSE 0 END) AS 'PRICE BETWEEN 80K-1L',
SUM(CASE WHEN salary_USD  >= 100000 THEN 1 ELSE 0 END) AS 'PRICE ABOVE 1L'
From
jobs.`ai jobs`
order by
Job_Title;
 
#List industries with their required skills
select
Industry,
Required_Skills,
COUNT(*) AS Number_Of_Jobs
FROM 
jobs.`ai jobs`
GROUP BY 
Industry, Required_Skills
ORDER BY 
Industry DESC;



