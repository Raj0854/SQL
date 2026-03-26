show databases;use raj;
show tables;
create table authors(
author_id bigint primary key,
first_name varchar(100) not null,
last_name varchar(100) not null

);
select*from authors;
insert  into authors(author_id,first_name,last_name )
values(101,"jaun","eelia");
insert  into authors(author_id,first_name,last_name )
values(102,"vishal","bhardwaj");
insert  into authors(author_id,first_name,last_name )
values(105,"john","wick");
create table books(
book_id bigint primary key,
price int,
stock int default 0
);
select * from books;
-- 26 march 2026
-- update query
show databases;
use classicmodels;
show tables;
select*from customers;
update customers set creditlimit = 30000 where customerNumber =103;

-- delete records
-- delete from customers where customerNumber =103;

-- like 
select* from customers where city like "m%";
select* from customers where state  like "n%";

-- top list (limit)
select* from customers limit 15;

-- order by
select* from customers order by customerNumber asc;
select* from customers order by customerNumber desc;

select * from customers order by creditlimit asc limit 20;
select * from customers order by creditlimit desc limit 20;



