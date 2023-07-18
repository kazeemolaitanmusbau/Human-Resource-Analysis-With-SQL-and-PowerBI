create database `hr analysis`;

use `hr analysis`;

select * from `hr data`;

-- show the summary of the hr data
describe `hr data`;

-- change the column name ï»¿id to emp_id
alter table `hr data`
change column ï»¿id emp_id varchar(20) not null;

-- birthdate is not consistent, restructure the information inside the column and the date in y-m-d format
update `hr data`
set birthdate =
 case
when birthdate like "%/%/%" then date_format(str_to_date(birthdate, "%m/%d/%Y"), "%Y-%m-%d")
else date_format(str_to_date(birthdate, "%m-%d-%Y"),  "%Y-%m-%d")
end;

-- the birthday still in text datatype, convert it to datetime
alter table `hr data`
change column birthdate birthdate date not null; 


-- hire_date is not consistent, restructure the information inside the column and the date in y-m-d format
update `hr data`
set hire_date =
 case
when hire_date like "%/%/%" then date_format(str_to_date(hire_date, "%m/%d/%Y"), "%Y-%m-%d")
else date_format(str_to_date(hire_date, "%m-%d-%Y"),  "%Y-%m-%d")
end;

-- the hire_date still in text datatype, convert it to datetime
alter table `hr data`
change column hire_date `hire date` date not null; 




select * from `hr data`;


-- change the structure of the termdate
update `hr data`
set termdate= case
when termdate  then  date(str_to_date(termdate, "%Y-%m-%d %H:%i:%s UTC"))
else  null
end;

-- convert termdate to date datatype
alter table `hr data`
modify termdate date;


-- create age column
alter table `hr data`
add column age int;



-- update the age column to age of the employee
update `hr data`
set age = timestampdiff(year, birthdate, curdate());


-- some age are having negative values.. we will remove this values

-- count of age with negative values
select count(age) from `hr data`
where age<0;

delete from `hr data`
where age<0;