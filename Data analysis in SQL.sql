Create Database Assignment_full
Use Assignment_full

--------ALL TABLES CREATED FIRST-------
Create table jobs(
JOB_ID varchar(20) primary key,
JOB_TITLE Varchar(35),
MIN_SALARY int,
MAX_SALARY int
)
Select *from jobs
--------------------
Create table Region(
REGION_ID int primary key,
REGION_NAME varchar(25)
)
Select *from Region
--------------------
Drop table countries 
Create table Countries(
COUNTRY_ID char(2) primary key,
COUNTRY_NAME varchar(40),
REGION_ID int foreign key references region(region_id) 
)
Select *from Countries
---------------------

Drop table locations
Create table locations(
Location_id int primary key,
STREET_ADDRESS varchar(42),
POSTAL_CODE varchar(12),
CITY varchar(30),
STATE_PROVINCE varchar(20),
COUNTRY_ID char(2) foreign key references countries(country_id)
)
Select *from locations

Create table department(
DEPARTMENT_ID int primary key,
DEPARTMENT_NAME varchar(30),
MANAGER_ID int,
LOCATION_ID int foreign key references locations(Location_id)
)

Create table Job_history(
EMPLOYEE_ID int,
START_DATE date,
END_DATE date,
JOB_ID varchar(10),
DEPARTMENT_ID int,
primary key(EMPLOYEE_ID,START_DATE)
)

Create table Job_grades(
GRADE_LEVEL varchar(2),
LOWEST_SAL int,
HIGHEST_SAL int
)


Create Table employees(
EMPLOYEE_ID int primary key,
FIRST_NAME Varchar(20),
LAST_NAME Varchar(25),
EMAIL Varchar(25),
PHONE_NUMBER Varchar(20),
HIRE_DATE Date,
JOB_ID varchar(20) foreign key references Jobs(JOB_ID),
SALARY int,
COMMISSION_PCT float,
MANAGER_ID int,
DEPARTMENT_ID int)

Select *from employees


----------Answers----------

----1----
Select first_name,last_name,salary from employees where SALARY<6000

---2----
Select first_name,last_name,DEPARTMENT_ID,salary from employees where SALARY>8000

---3----
Select first_name,last_name,DEPARTMENT_ID from employees where LAST_NAME like '%McEwen'

---4----
Select EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,COMMISSION_PCT,MANAGER_ID from employees

---5---
Select *from department where DEPARTMENT_NAME =' Marketing'

---6---
Select first_name,last_name,hire_date,salary,department_id from employees where FIRST_NAME not like 'M%' order by DEPARTMENT_ID asc

---7---
Select *from employees where SALARY between 8000 and 12000 and COMMISSION_PCT >=0 and DEPARTMENT_ID not in (40,120,70) 
and HIRE_DATE > '1987-06-05'

---8---
Select first_name,last_name,salary from employees where COMMISSION_PCT=0

---9---(doubt: seperated by hyphen)---
Select first_name+last_name as Full_name,PHONE_NUMBER+EMAIL as Contact_details,SALARY as Remuneration
 from employees where SALARY between 9000 and 17000
 
---10---
Select First_name,last_name,salary from employees where FIRST_NAME like '%M'

---11---
Select First_name+last_name as full_name,salary from employees where SALARY not between 7000 and 15000

---12---
Select First_name+last_name as full_name,job_id,hire_date from employees where HIRE_DATE in ('2007-11-05','2009-07-05')

---13---
Select First_name+last_name as full_name,department_id from employees where DEPARTMENT_ID = 70 or DEPARTMENT_ID = 90

---14---
Select First_name+last_name as full_name, manager_id from employees where MANAGER_ID >0

---15---
Select *from employees where HIRE_DATE <'2002-06-21'

---16---
Select First_name,Last_name,email,salary,manager_id from employees where MANAGER_ID in (120,103,145)

---17---Doubt--
Select *from employees where FIRST_NAME like '[%D,S,R%]'

---18---
Select First_name,Last_name as full_name,hire_date,commission_pct,email,phone_number,salary from employees where
SALARY>11000 or PHONE_NUMBER like '______3%' order by FIRST_NAME desc

---19---
Select Employee_Id,FIRST_NAME,LAST_NAME,DEPARTMENT_ID from employees where FIRST_NAME like '___s%'

---20---
Select employee_ID,first_name,job_id, department_Id from employees where DEPARTMENT_ID not in (50,30,80)

---21---
Select employee_ID,first_name,job_id, department_Id from employees where DEPARTMENT_ID in (30,40,90)

---22---
Select country_id,count(city) as no_of_cities from locations group by COUNTRY_ID

---23---
Select manager_id,COUNT(employee_id)from employees group by MANAGER_ID

---24---
Select *from jobs order by JOB_TITLE desc

---25------
Select first_name,last_name,hire_date,JOB_TITLE from employees e inner join jobs j on 
e.JOB_ID=j.JOB_ID where JOB_TITLE=' Sales Representative            ' or JOB_TITLE=' Sales Manager                   '

---26-------
Select department_id,Avg(salary)as Avg_salary from employees group by DEPARTMENT_ID

---27-----
---28-----
Select e.EMPLOYEE_ID, end_date from employees e inner join Job_history j on e.EMPLOYEE_ID=j.EMPLOYEE_ID

--29-----
Select *from employees where COMMISSION_PCT=0 and SALARY between 7000 and 12000 and DEPARTMENT_ID=50

---30-----
Select job_id ,(MIN_SALARY+MAX_SALARY)/2 as avg_salary from jobs where (MIN_SALARY+MAX_SALARY)/2  >8000

---31-----
Select Job_title,Max_salary-Min_salary as difference_of_sal,max_salary from jobs where MAX_SALARY between 12000 and 18000

---32---
Select *from jobs where MIN_SALARY>9000

---33---
Select *from employees where HIRE_DATE >'1987-09-07'




------SUBQUERY----

--1--
Select FIRST_NAME,Last_name,SALARY from employees where SALARY >(select SALARY From employees where EMPLOYEE_ID=163)

--2----
Select First_name+last_name as full_name,salary,department_id,JOB_ID from employees where JOB_ID=(select JOB_ID from employees where EMPLOYEE_ID=169)

---3----
Select employee_id,first_name+last_name as employee_name,salary from employees where SALARY >(Select AVG(salary) from employees)

---4----
Select FIRST_NAME+LAST_NAME as Employee_Name from employees where MANAGER_ID=122

---5----
Select e.DEPARTMENT_ID,first_name+last_name as employee_name,JOB_TITLE,department_name from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID
inner join jobs j on e.JOB_ID=j.JOB_ID where DEPARTMENT_NAME = ' Finance              '

---6---
Select *from employees where SALARY=3000 and MANAGER_ID =121

---7---
Select *from employees where EMPLOYEE_ID in (134,159,189)

---8---
Select *from employees where SALARY between 1000 and 3000

---9--
Select *from employees where SALARY between(select MIN(salary)from employees)and 2500

---10--
Select *from employees where MANAGER_ID not between 100 and 200

---11--
Select employee_id, MAX(salary) from employees where SALARY <(select MAX(salary) from employees) group by EMPLOYEE_ID 

---12--
Select employee_Id, first_name+last_name as full_name,DEPARTMENT_ID from employees where FIRST_NAME like '%t%' or LAST_NAME like '%t%'

---13--
Select employee_id,first_name+last_name as full_name,salary from employees where SALARY <(select AVG(salary) from employees) and FIRST_NAME
like '%j%' or LAST_NAME like '%j%'

---14--
Select employee_id,first_name,last_name,job_title,CITY from employees e inner join jobs j on e.JOB_ID=j.JOB_ID inner join 
department d on d.DEPARTMENT_ID=e.DEPARTMENT_ID inner join locations l on d.LOCATION_ID=l.Location_id where CITY='Toronto'

---15--
Select employee_id,first_name+last_name as full_name,salary,job_title,j.JOB_ID from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID inner
join jobs j on e.JOB_ID=j.JOB_ID  where SALARY< 13000

---16---
Select employee_id,first_name+last_name as full_name,salary,job_title,j.JOB_ID from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID inner
join jobs j on e.JOB_ID=j.JOB_ID where SALARY<11000

---17---
Select employee_id,First_name+last_name as full_name,salary,job_title from employees e inner join jobs j on e.JOB_ID=j.JOB_ID where
SALARY >(select AVG(salary) from employees)

---18---
Select first_name+last_name as full_name,SALARY,DEPARTMENT_NAME from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID
where SALARY > 3700 

---19--
Select department_id,SUM(salary) from employees group by DEPARTMENT_ID 

---20---
Select department_id,count(EMPLOYEE_ID) from employees group by DEPARTMENT_ID

---21---
select *from employees e inner join department d on e.DEPARTMENT_ID = d.DEPARTMENT_ID inner join locations l on d.LOCATION_ID=l.Location_id inner
join Countries c on l.COUNTRY_ID=c.COUNTRY_ID where COUNTRY_NAME='United Kingdom'

---22---
Select *from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID
where SALARY >(select AVG(salary) from employees) and DEPARTMENT_NAME =' IT                   '

---23---
Select FIRST_NAME,LAST_NAME,SALARY from employees where SALARY>11500

---30---
Select *from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID inner join locations l on d.LOCATION_ID=l.Location_id
inner join Countries c on c.COUNTRY_ID=l.COUNTRY_ID where COUNTRY_NAME='United States of America '

---31----
Select e.DEPARTMENT_ID,department_name,CITY from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID	inner join locations l on
d.LOCATION_ID=l.Location_id where CITY = 'London'

---32----
Select	first_name+last_name as full_name,salary,department_id from employees where SALARY>(select AVG(salary) from employees) order by SALARY desc

---33----
Select first_name+last_name as full_name,salary,department_id from employees where SALARY>(select AVG(salary) from employees) and DEPARTMENT_ID
=40

---34----
Select department_name, department_id,city from department d inner join locations l on d.LOCATION_ID=l.Location_id where DEPARTMENT_ID=30

---35----
Select first_name+last_name as full_name,salary,department_id from employees where DEPARTMENT_ID in(select DEPARTMENT_ID from employees where EMPLOYEE_ID=201)

---36----

Select first_name+last_name as full_name,salary,department_id from employees where SALARY=(select SALARY from employees where DEPARTMENT_ID=40)

---37----
Select first_name+last_name as full_name,e.DEPARTMENT_ID from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID where department_name=' Marketing            '

---38----
Select first_name+last_name as full_name,salary,department_id from employees where SALARY>(select min(SALARY) from employees where DEPARTMENT_ID=40)

---39----
Select first_name+last_name as full_name,email,hire_date,job_title from employees e inner join jobs j on e.JOB_ID=j.JOB_ID where HIRE_DATE>(select HIRE_DATE from employees where EMPLOYEE_ID=165)

---40----
Select first_name+last_name as full_name,salary,department_id from employees where SALARY<(select MIN(SALARY) from employees where DEPARTMENT_ID=70)

---41----
Select first_name+last_name as full_name,salary,department_id from employees where salary>(select avg(salary) from employees )and DEPARTMENT_ID
=(select department_id from employees where FIRST_NAME=' Laura ')

---42----
Select employee_id,city from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID inner join locations l on d.LOCATION_ID=l.Location_id 
where e.EMPLOYEE_ID=134
 
---43----
Select *from department d inner join employees e on d.DEPARTMENT_ID=e.DEPARTMENT_ID where SALARY >=8000
 
---45----
Select MANAGER_ID, count(EMPLOYEE_ID) as emp_count from employees group by MANAGER_ID having count(EMPLOYEE_ID)>4

---46----
Select first_name+last_name as full_name, e.JOB_ID,job_title,MIN_salary,max_salary,JOB_TITLE from jobs j inner join employees e on e.JOB_ID=j.JOB_ID inner join department d on d.DEPARTMENT_ID=e.DEPARTMENT_ID
inner join Job_history h on h.DEPARTMENT_ID=d.DEPARTMENT_ID where h.JOB_ID='SA_REP'

---47----
Select *from employees where SALARY>(select MIN(salary) from employees) order by salary ASC

---48----
Select *from employees where DEPARTMENT_ID=(select EMPLOYEE_ID from employees where FIRST_NAME=' Susan ')

---49----
Select department_id,first_name+last_name as full_name,salary from employees where salary in(select MAX(salary) from employees group by
DEPARTMENT_ID)






------------Joining questions------------

---1---
Select first_name,last_name,d.DEPARTMENT_ID,department_name from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID
 
---2---
select first_name,last_name,department_name,city,state_province from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID
inner join locations l on d.LOCATION_ID=l.Location_id

---3---
Select First_name,last_name,salary,GRADE_LEVEL from employees e inner join Job_grades j on e.EMPLOYEE_ID=j.GRADE_LEVEL ---(doubt)----

---4---
Select first_name,last_name,d.DEPARTMENT_ID,department_name from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID where
d.DEPARTMENT_ID =40 or d.DEPARTMENT_ID = 80

---5---
Select first_name,last_name,department_name,city,STATe_province from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID inner
join locations l on l.Location_id=d.LOCATION_ID where FIRST_NAME like '%z%' 

---6---
Select *from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID where EMPLOYEE_ID =null 

---7---
Select first_name,last_name,salary from employees where SALARY<(select SALARY from employees where EMPLOYEE_ID=182)

---8---
Select e.EMPLOYEE_ID,e.FIRST_NAME,e.MANAGER_ID from employees e inner join employees f on e.EMPLOYEE_ID=f.MANAGER_ID

---9---
Select department_name,city,state_province from department d inner join locations l
on l.Location_id=d.LOCATION_ID order by DEPARTMENT_NAME asc

---10--
Select first_name,last_name,d.DEPARTMENT_ID,department_name from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID 

---11-----
Select e.EMPLOYEE_ID, e.FIRST_NAME,f.MANAGER_ID from employees e inner join employees f on e.EMPLOYEE_ID=f.MANAGER_ID

---12----
Select first_name,last_name,department_id from employees where LAST_NAME= ' Taylor '

---13---
Select MAX(Salary)-salary, First_name+last_name as full_name,job_title,salary from employees e inner join jobs j on j.JOB_ID=e.JOB_ID 

---14---
Select department_name,AVG(salary)as avg_salary,count(employee_id) head_count from employees e inner join 
department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID group by DEPARTMENT_NAME 

---15-----
Select country_name,city,department_name from department d inner join locations l on d.LOCATION_ID=l.Location_id inner join Countries c on 
c.COUNTRY_ID=l.COUNTRY_ID

---16-----
Select FIRST_NAME+LAST_NAME as full_name,e.DEPARTMENT_ID,DEPARTMENT_NAME from employees e inner join department d on 
e.DEPARTMENT_ID=d.DEPARTMENT_ID where e.MANAGER_ID=e.MANAGER_ID

---17-----
select e.EMPLOYEE_ID from employees e inner join Job_history h on e.EMPLOYEE_ID=h.EMPLOYEE_ID where SALARY>=12000

---18-----
Select country_name,city,d.DEPARTMENT_ID from department d inner join locations l on d.LOCATION_ID=l.Location_id inner join Countries c on 
c.COUNTRY_ID=l.COUNTRY_ID inner join employees e on e.DEPARTMENT_ID=d.DEPARTMENT_ID where EMPLOYEE_ID >= 2 
---19------
Select department_name,first_name+last_name as full_name,city from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID inner
join locations l on l.Location_id=d.LOCATION_ID where e.MANAGER_ID=e.MANAGER_ID

---20-----
Select first_name+last_name as full_name,salary from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID inner join locations l
on l.Location_id=d.LOCATION_ID where CITY ='London'

---21-----
Select first_name+last_name as full_name,Job_title,STArt_date,end_date from employees e inner join Job_history h on e.EMPLOYEE_ID=h.EMPLOYEE_ID
inner join jobs j on j.JOB_ID=e.JOB_ID where COMMISSION_PCT=0

---22-----
Select Count(employee_id)as NO_PEOPLE,d.DEPARTMENT_ID from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID
group by d.DEPARTMENT_ID

---23-----
Select employee_id,First_name+last_name as full_name,COUNTRY_NAME from employees e inner join department d on e.DEPARTMENT_ID=d.DEPARTMENT_ID 
inner join locations l on d.LOCATION_ID=d.LOCATION_ID inner join Countries c on l.COUNTRY_ID=c.COUNTRY_ID
