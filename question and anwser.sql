-- 1. what is the employee id and the name of oldest and the youngest employee in each of the department

-- 2. what is the break down employee in the location state and city

-- 3. what is the break down of empyloyee by jobtitle wise
CREATE VIEW `employee count` AS
SELECT jobtitle, count(jobtitle) `employee count`
FROM  `hr data`
GROUP BY jobtitle
order by `employee count` desc;

-- 4. show the age distribution of the employees
select  case
WHEN age<20 THEN "Teen"
WHEN age>=20 and age<30 THEN "twenties"
WHEN age>=30 AND age<40 THEN "thirties"
WHEN age>=40 AND age<50 THEN "fourties"
WHEN age>=50 AND age<60 THEN "fifties"
ELSE 'older'
	END `age distribution`, count(*) count
    FROM `hr data`
    GROUP BY `age distribution`
    ORDER BY count;
    
-- 5. WHAT IS THE DISTRIBUTION OF AGE OF EMPLOYEE BY GENDER WISE
select gender, case
WHEN age<20 THEN "Teen"
WHEN age>=20 and age<30 THEN "twenties"
WHEN age>=30 AND age<40 THEN "thirties"
WHEN age>=40 AND age<50 THEN "fourties"
WHEN age>=50 AND age<60 THEN "fifties"
ELSE 'older'
	END `age distribution`, count(*) count
    FROM `hr data`
    GROUP BY gender,`age distribution`
    ORDER BY gender;
    
    
-- 6. what is the breakdown of employee gender
CREATE VIEW `gender count` AS
SELECT gender ,count(gender)
from `hr data`
group by gender;


-- 7. HOW MANY EMPLOYEES WORK IN HEAD QUARTER VERSUS ROMOTE
SELECT location, count(*) count FROM `hr data`
WHERE location IN ("Headquarters", "Remote")
GROUP BY location;

-- 8. WHAT IS THE AVERAGE LENGTH OF EMPLOYEMMENT FOR EMPLOYEE WHHOSE CONTRACT HAS BEEN TERMINATED
SELECT AVG(datediff(termdate, `hire date`)) /365
FROM `hr data`
WHERE termdate IS NOT NULL;


-- 9. HOW DOES GENDER DISTRIBUTION VARY ACROSS DEPARTMENT AND JOBTITLE
SELECT  department,gender, count(*) `count of employees`
FROM `hr data`
GROUP BY gender, department
ORDER BY department;

-- 10. WHAT IS THE DISTRIBUTION OF JOBTITLE ACROSS THE COMPANY

-- 11. WHAT DEPARTMENT HAS THE HIGHEST TURNOVER RATE

-- 12. WHAT IS THE DISTRIBUTION OF EMPLOYEE ACROSS LOCATION BY STATE AND CITY

-- 13. HOW HAS THE COMPANY EMPLOYEE'S COUNT CAHNGED OVER THE  TIME BASED ON HIRE AND TERM DATES
with a as (select 
SUM(CASE WHEN termdate is null THEN 1 ELSE 0 END ) `count of current employee`,
SUM(CASE WHEN termdate is not null THEN 1 ELSE 0 END ) `count of term employee`,
year(`hire date`) hire
FROM `hr data`
GROUP BY hire) select *, (`count of term employee`/  `count of current employee`) * 100 rate from a;

-- WHAT IS THE TENURE DISTRIBUTION FOR EACH DEPARTMENT