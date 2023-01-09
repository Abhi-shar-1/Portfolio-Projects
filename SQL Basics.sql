create table abhishek  
(Emp_id int,
Name char(30),
Salary int,
Mobile bigint,
Constraint pks primary key (emp_id),
Constraint ck check (salary>=30000),
Constraint uq unique(Mobile)
)
Select *from abhishek
insert into abhishek values(201,'Deepak Malik',45000,981199011)
insert into abhishek values(202,'Vikrant Shekhawat',299999,981199012)
insert into abhishek values(203,'Harish Bisht',65000,889019920)
insert into abhishek values(204,'Ram sharma', 67000,880198990)
insert into abhishek values(205,'Shubham shrestha',72000,8878901258)
insert into abhishek values(206,'Gaurav shukla',80000,9800145711)
insert into abhishek values(207,'Rocky singh',50000,9011345678)
------------updating record-------------------------------------------

update abhishek set Salary=55000 where Emp_id=201
---------------search a record----------------------------------------
select *from abhishek where Name like '%A' ------Name ending with A and vice versa--
select *from abhishek where Name like '[A-r]%' -------names from A-r-----
select *from abhishek where Name like '%k%' ------where Alphabet is anywhere in name--
select *from abhishek where Name like '____A%'----digit wise name search---

----------------adding a column in the table and updating it-------------

Alter table abhishek add Emp_Address_1 char(30),Emp_Designation char (30)
update abhishek set Emp_Address_1 ='Delhi' where Emp_id=204
update abhishek set Emp_Address_1 ='Mumbai' where Emp_id = 207

---------------Updating the other row as well....----------------
Alter table abhishek add Incentive_current_year int
constraint chk check (incentive_current_year<=75) 
----------Doubt(if a new column is added can we also add a constraint with it---------


alter table abhishek drop column Incentive_current_year
----------Select *from abhishek-----
update abhishek set Emp_Designation = 'Sr Analyst' where Emp_id in (202,206)
update abhishek set Emp_Designation = 'Tester' where Emp_id=207
update abhishek set Emp_Designation = 'AVP' where Emp_id=204
update abhishek set Emp_designation = 'Manager'where Emp_id in (201,203)
update abhishek set Emp_Designation = 'Team Leader' where Emp_id = 205

------------Rename a column----------------------------------
select *from abhishek
SP_RENAME 'Abhishek.Designation','Emp_Designation'

--------------------------Conditional queries---------------
select *from abhishek order by Name ASC
select *from abhishek order by Name Desc 
select *from abhishek where Emp_Address_1 in('pune','Delhi')
select *from abhishek where Emp_Address_1 = 'pune'or Emp_Address_1='Delhi'
select *from abhishek where Emp_Address_1 = 'Gurugram'and Salary >=70000
select *from abhishek where Emp_Address_1 = 'Delhi' or Emp_Address_1 = 'Pune' and Salary >=35000
------(*Always remember that in case of OR query condition must be specified again)---



----------Between---------
Select *from abhishek where Salary between 60000 and 70000

-----------NOT IN-----------
Select *from abhishek where Emp_Address_1 not in ('Gurugram','Pune')
---------Add a comma to view multiple not in records-----------

-----MAX AND MIN---------------
Select MAX(salary) from abhishek
Select MAX(Salary) as salary from abhishek where Emp_Address_1='Delhi'
Select MAX(Salary) as salary from abhishek where Emp_Address_1='pune'
Select MAX(Salary) as salary from abhishek where Emp_Address_1='Gurugram'

Select MIN(salary) as salary from abhishek
Select MIN(salary) as salary from abhishek where Emp_Address_1 ='Delhi'
Select MIN(salary) as salary from abhishek where Emp_Address_1 ='pune'

------Average-----------
Select AVG(salary) from abhishek
Select AVG(salary) from abhishek where Emp_Address_1='Delhi'

---------Count-----------
select count(salary) from abhishek
select count(salary) from abhishek where Emp_Address_1 in ('Delhi','Gurugram')and Salary <=100000
select *from abhishek

---------Sum--------------

Select SUM(salary) from abhishek
Select SUM(salary) from abhishek where Emp_Address_1 in ('Delhi', 'Pune','Gurugram')
---Add in and in bracket increase as much after adding commas------

-----------Group By------------
Select Emp_address_1,sum(salary) from abhishek group by Emp_Address_1
select Emp_id ,(salary),Emp_Designation from abhishek group by Emp_id,Emp_Designation
----(very interesting & useful clause can be used to make conditional queries---------
 
select Emp_Address_1,SUM(salary) as Emp_salary from abhishek having Emp_Address_1='Delhi'
select Emp_Address_1,sum(salary)as emp_salary from abhishek group by Emp_Address_1 having Emp_Address_1 = 'Delhi'
Select Emp_Designation,Emp_Address_1, SUM(salary) as emp_salary from abhishek group by Emp_Designation,Emp_Address_1 having Emp_Designation= 'Sr Analyst'
Order by Emp_Address_1 Asc

select *from abhishek
update abhishek set Name='Deepak Sehrawat' where Emp_id= 201
Alter table abhishek add Emp_address_2 char(40)
Alter Table abhishek drop column Emp_address_2
Alter Table abhishek add Emp_manager char(30)
update abhishek set Reporting_manager='Vinay Jain' where Emp_id=201
update abhishek set Reporting_manager='Yashwant Julka' where Emp_id=203
update abhishek set Reporting_manager= 'Harsh Nagar' where Emp_id=204
update abhishek set Reporting_Manager = 'Laxman Parmar' where Emp_id =202
Update abhishek set reporting_manager= 'Abhimanyu Das' where Emp_id= 205
update abhishek set reporting_manager = 'Madhav shastri' where Emp_id= 207
Sp_rename 'abhishek.Emp_manager','Reporting_Manager'

select *from abhishek
select emp_address_1,SUM(salary) from abhishek group by emp_address_1
having Emp_Address_1='gurugram'

select emp_address_1,SUM(salary) from abhishek group by emp_address_1
having Emp_Address_1 in('delhi','gurugram')

select MAX(salary) from abhishek
select * from abhishek where salary=(select MAX(salary) from abhishek)

select emp_address_1,max(salary) from abhishek group by emp_address_1


Select *from abhishek

Create table abhishek_2 (
Dept_id int,
Dept_name char (30),
Dept_key int primary key
)
Select *from abhishek_2
Select *from abhishek
insert into abhishek_2 values (101,'HR',9),(777,'IT',99),(122,'OPS',67),(91,'MKT',91),(88,'R&D',18)
update abhishek_2 set Dept_key='201' where Dept_id='101'
select *from abhishek inner join abhishek_2 on Emp_id = Dept_key

select emp_id,name,salary,Emp_address_1,Dept_id,Dept_name,Dept_key from abhishek inner join abhishek_2 on Emp_id=Dept_key
--------(Very important fucntion)--------------
------(Now,Multiple tables joining)------------
Create table Location(
Emp_UID int,
Emp_transfer_location char(30),
Emp_trans_date date,
Location_id int primary key
)
Select *from Location
insert into Location values (205,'Bangkok','09-20-2022',998),(203,'Toronto','01-10-2023',120),(201,'LA','11-10-2022',102)

Select Emp_id,Name,Salary,Emp_transfer_location,Emp_trans_date,Location_id from abhishek inner join Location on Emp_id=Emp_UID

Select *from abhishek inner join abhishek_2 on Emp_id= dept_key inner join Location on Emp_id=Emp_UID

Select Emp_id,name,Salary,Emp_designation,Dept_name,Emp_transfer_location,Emp_trans_date,Location_id from abhishek inner join
abhishek_2 on Emp_id=Dept_key inner join Location on Dept_key=Emp_UID
---(More than two colums joined above)----------------

Select *from abhishek e left outer join abhishek_2 d on e.Emp_id=d.Dept_key
Select *from abhishek e right outer join abhishek_2 d on e.Emp_id=d.Dept_key

Select Emp_id,name,salary,dept_name,dept_id,dept_name from abhishek e right outer join abhishek_2 d on e.Emp_id=d.Dept_key
Select Emp_id,name,salary,dept_name,dept_id from abhishek e left outer join abhishek_2 d on e.Emp_id=d.Dept_key

Select *from abhishek full outer join abhishek_2 on Emp_id=Dept_key ------(Shows left and right both values)---------

select *From abhishek

select * from abhishek where Salary=(select max(Salary)from abhishek)
select *from abhishek where Salary=(select MAX(salary) from abhishek where Salary<(select MAX(salary) from abhishek))

select *from abhishek where Salary=(select MAX(salary) from abhishek where Salary <(select MAX(salary)from abhishek
where Salary <(select MAX(salary)from abhishek)))

create procedure add_column
as 
alter table abhishek add location_id int
go

execute add_column

create procedure drop_column
as
alter table abhishek drop column location_id
go

execute drop_column

create procedure abhiview
as
Select *from abhishek_2
Select *from Location
go


execute abhiview
Select *From Location

Create procedure AbhiJoin
as
select *from abhishek e inner join Location l on e.Emp_id=l.Emp_UID inner join Location C on e.Emp_id=c.Emp_UID
go

Execute AbhiJoin


Create Procedure Check_2
@Emp_UID int,
@Emp_transfer_location char(30),
@Emp_trans_date date,
@Location_id int
as insert into Location values(@Emp_UID,@Emp_transfer_location,@Emp_trans_date,@Location_id)

execute Check_2 114,'New Delhi','2022-12-10',899
Select *from Location

Create procedure Check_3_update
@Emp_UID int,
@Emp_transfer_location char(30),
@Emp_trans_date date,
@Location_id int
as update Location set Emp_transfer_location=@Emp_transfer_location,Emp_trans_date=@Emp_trans_date,Location_id=@Location_id where Emp_UID=@Emp_UID
Execute Check_3_update 114,'Tokyo','2023-06-01',888

Create procedure Check_4_delete
@emp_UID int
as 
Delete from Location where Emp_UID=@Emp_UID

Execute Check_4_delete 114
Execute locview


-------ADVANCED STORED PROCEDURE------
Create table OPS(
Name char(30),
Department Char(30),
Salary int,
Age int
)

Alter procedure Comp_ops
@Name Char(30)=null,
@Department char(30)=null,
@Salary int=0,
@Age int=0,
@Run_Comp varchar(30)=null
As 
Begin

If @Run_Comp='Insert'
begin
Insert into OPS(Name,Department,Salary,Age)Values(@Name,@Department,@Salary,@Age)
END


If @Run_Comp='Delete'
Begin
Delete from OPS where Name=@Name
END 

IF @Run_Comp='Select'
Begin
Select *from OPS
END

If @Run_Comp='Update'
Begin
Update OPS set Name=@Name,Department=@Department,Salary=@Salary,Age=@Age where Department=@Department
End
end

execute comp_ops @name='Harman' ,@Run_Comp='delete'
execute Comp_ops @run_comp='Select'