-- Authors (author_id, first_name, last_name, birth_year, nationality)
-- Books (book_id, title, author_id, publication_year, genre, price, stock)
-- Customers (customer_id, first_name, last_name, email, join_date)
-- Orders (order_id, customer_id, book_id, order_date, quantity, total_amount)
show databases; 
 use raj;
 show tables;
 drop table authors;drop table books;
 create table Authors(
 author_id bigint primary key,
 first_name varchar(100) not null,
 last_name varchar(100) not null,
 birth_year year,
 nationality enum('indian', 'foreignor')
 );
 
  create table Books(
 book_id bigint primary key,
 title varchar(100) not null,
 author_id bigint,
 publication_year year,
 genre varchar(100),
 price  decimal(10,2) check(price> 0),
 stock bigint default 0
 );
 
 -- Insert three authors into the Authors table with different nationalities
 