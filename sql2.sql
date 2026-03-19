show databases;
create database raj;
use raj;
show tables;
create table employee(
id int primary key auto_increment,
name varchar(100),
city varchar(100),
contact_no bigint unique key,
email varchar(100),
dob date,
dept enum('package','production','it','sales'),
salary bigint
);
select* from employee;
drop table employee;
insert into employee(id,name,city,contact_no,email,dob,dept,salary)
values(101,"ashwin","mumbai",8748757445,"aswhin@123.com","1998-05-21",'it',21000);
insert into employee(name,city,contact_no,email,dob,dept,salary)
values("aftab","vasai",8282828285,"aftab@123.com","1993-05-28",'sales',22000);
insert into employee(name,city,contact_no,email,dob,dept,salary)
values("prem","nallasopara",98574868595,"prem@123.com","1993-05-28",'production',19000);
insert into employee(name,city,contact_no,email,dob,dept,salary)
values("alaam","naigaon",78486952522,"aalam@123.com","1991-05-28",'package',18000);
-- truncate table
-- truncate means clearing the table 
show databases;
use raj;
show tables;
select* from employee;
-- 19 march 2026
show databases;
use classicmodels;
show tables;
select *from customers;
-- where (condition) 
-- and operator
-- or operator
-- signs =,>,<

select * from customers where city = "NYC";
select count(country) from customers where city = "NYC";
-- when both condition are true use and operator
select * from customers where country = "USA" and creditlimit > 100000;
-- when one condtion are true use or operator
select * from customers where country = "USA" or city = "NYC";
