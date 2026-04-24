show databases;
use classicmodels;
-- ============================================
-- like 
select* from customers where city like "m%";
select* from customers where state  like "n%";
-- ============================================
-- top list (limit)
select* from customers limit 15;
-- ============================================
-- order by
select* from customers order by customerNumber asc;
select* from customers order by customerNumber desc;
select * from customers order by creditlimit asc limit 20;
select * from customers order by creditlimit desc limit 20;