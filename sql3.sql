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