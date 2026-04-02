-- Create a database named CompanyDB and add the following tables:

show databases;
create database companyDB;
use companyDB;
show tables;
create table department(
department_id int primary key,
department_name varchar(100)
);
create table employees(
empID INT primary key,
firstname varchar(50),
lastname varchar(50),
age int,
salary decimal(10,2),
department_id int, 
foreign key (department_id) references department(department_id),
joining_date date
);
-- Insert at least 3 records into the Departments table and at least 10 records into the Employees table with different details.
insert into department values(111,"sales");
insert into department values(222,"IT");
insert into department values(333,"Marketing");
select*from department;

insert into employees values(1,"aman","mishra",22,12500,111,"2026-02-22");
insert into employees values(2,"ajay","gill",21,20550,222,"2026-02-21");
insert into employees values(3,"bineet","kumar",20,14844,333,"2026-05-22");
insert into employees values(4,"vishal","mishra",25,16500,111,"2026-12-22");
insert into employees values(5,"manish","gupta",22,19000,222,"2026-07-22");
insert into employees values(6,"manoj","sharma",27,18000,333,"2026-03-22");
insert into employees values(7,"kisan","rajbhar",25,13500,333,"2026-11-22");
insert into employees values(8,"karan","pal",29,14500,222,"2026-09-22");
insert into employees values(9,"ashwin","updhaya",32,17500,222,"2026-04-22");
insert into employees values(10,"chandan","yadav",28,15000,111,"2026-06-22");
select*from employees;

-- Write a query to display all employees along with their department names.
-- select * from employees , department(department_name
