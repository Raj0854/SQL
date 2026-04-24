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
select * from customers where country = "USA" and creditlimit = "0";
select * from customers where  creditlimit > "50000" and creditlimit < "100000";
select count(creditlimit) from customers where  creditlimit > "50000" and creditlimit < "100000";
