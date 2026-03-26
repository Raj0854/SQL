-- Authors (author_id, first_name, last_name, birth_year, nationality)
-- Books (book_id, title, author_id, publication_year, genre, price, stock)
-- Customers (customer_id, first_name, last_name, email, join_date)
-- Orders (order_id, customer_id, book_id, order_date, quantity, total_amount)
show databases; 
 use raj;
 show tables;
 -- drop table authors;drop table books;
 create table Authors(
 author_id bigint primary key,
 first_name varchar(100) not null,
 last_name varchar(100) not null,
 birth_year year,
 nationality enum('indian', 'foreignor')
 );
 
  create table Books(
 book_id bigint auto_increment primary key,
 title varchar(100) not null,
 author_id bigint,
 publication_year year,
 genre varchar(100),
 price  decimal(10,2) check(price> 0),
 stock bigint default 0
 );
 
 -- Insert three authors into the Authors table with different nationalities
 insert into Authors(author_id, first_name, last_name, birth_year,nationality)
 values(101,"jaun","elia",1948,"indian");
insert into Authors values(105,"william","deo",1953,"foreignor");
insert into Authors values(109,"jubin","nautiyal",1998,"indian");

-- viewing the records
select*from Authors;
-- Insert five books into the Books table, ensuring at least two books are by the same author
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) 
VALUES
('Python Basics',101,2020,'Programming',20.00,10);
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) 
VALUES('Python advance',101,2021,'Programming',20.00,10);
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) 
VALUES('java script',105,2022,'languages',20.00,10);
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) 
VALUES('English',105,2021,'languages',20.00,10);
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) 
VALUES('Mysql',109,2025,'Programming',20.00,10);

select*from Books;