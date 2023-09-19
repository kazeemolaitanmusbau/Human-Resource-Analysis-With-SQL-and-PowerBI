-- 1. what is the employee id and the name of oldest and the youngest employee in each of the department
select h.emp_id, concat(h.first_name, " ", h.last_name) fullname, h.department , h.age 
from `hr data` h
join
(select department, min(birthdate) d
from `hr data` group by department)sub
on h.department=sub.department 
join
(select department, max(birthdate) dd
from `hr data` group by department)subb
on h.department=subb.department 
where h.birthdate = dd or h.birthdate = d
ORDER BY department; 

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
SELECT jobtitle, count(jobtitle) `count of jobtitle` from  `hr data`
GROUP BY (jobtitle)
ORDER BY jobtitle;

-- 11. WHAT DEPARTMENT HAS THE HIGHEST TURNOVER RATE
select h.department, count(h.department) `number of terminated employee`, `number of current employee`
, round(( count(h.department) / (count(h.department)+ `number of current employee`))* 100, 2) `percentage of termdate employee`
from `hr data` h join (select department, count(department) `number of current employee` from `hr data` where termdate is  null
group by department) sub
on h.department = sub.department
where termdate is not null
group by department
order by  `percentage of termdate employee`;

-- 12. WHAT IS THE DISTRIBUTION OF EMPLOYEE ACROSS LOCATION BY STATE 
SELECT location_state, COUNT(*) `count of employee`
FROM `hr data`
GROUP BY location_state;

-- 13. HOW HAS THE COMPANY EMPLOYEE'S COUNT CAHNGED OVER THE  TIME BASED ON HIRE AND TERM DATES
select `year`, `Total employee hired`, `Total employee working`, `Total employee terminated` , 
 round(`Total employee terminated`/`Total employee hired` * 100, 2 ) `precentage of teminated per year` from
(select  count(`hire date`) `Total employee hired`, sum(case when termdate is null then 1 else 0 end) `Total employee working`,
sum(case when termdate is not null then 1 else 0 end) ` Total employee terminated` , year(`hire date`) `year` from `hr data`
group by `year`) as d
order by `year`;




-- 14  WHAT IS THE TENURE DISTRIBUTION FOR EACH DEPARTMENT
