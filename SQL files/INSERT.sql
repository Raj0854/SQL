-- show databases
show databases;
-- create database

create database raj;
show databases;
use raj;

create table employee(
id_no int primary key,
name varchar(100),
date_of_joining date,
dept varchar(100),
contact_no bigint,
city varchar(100),
salary int
);

select * from employee;
insert into employee (id_no,name,date_of_joining,dept,contact_no,city,salary)
value(101,'Avinash','2023-03-21','production',8746874752,'vasai',21000);
insert into employee (id_no,name,date_of_joining,dept,contact_no,city,salary)
value(102,'Brijesh','2021-06-15','Packaging',7458962145,'virar',24000);
insert into employee (id_no,name,date_of_joining,dept,contact_no,city,salary)
value(103,'Charlie','2021-08-26','MARKETING',75852416322,'borivali',19000);
insert into employee (id_no,name,date_of_joining,dept,contact_no,city,salary)
value(104,'Dinesh','2022-08-21','HR',8921475624,'Nallasopara',25000);
insert into employee (id_no,name,date_of_joining,dept,contact_no,city,salary)
value(105,'Emran','2021-05-18','sales',7123548659,'bhaynadar',23000);


select*from employee;
