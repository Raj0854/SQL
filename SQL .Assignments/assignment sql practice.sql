-- Authors (author_id, first_name, last_name, birth_year, nationality)
-- Books (book_id, title, author_id, publication_year, genre, price, stock)
-- Customers (customer_id, first_name, last_name, email, join_date)
-- Orders (order_id, customer_id, book_id, order_date, quantity, total_amount)
show databases; 
 use raj;
show tables;
 drop table authors;drop table books;
 create table Authors(
 author_id int auto_increment primary key,
 first_name varchar(100) not null unique key,
 last_name varchar(100) not null unique key,
 birth_year year,
 nationality varchar(100)
 );
 
  create table Books(
 book_id bigint auto_increment primary key,
 title varchar(100) not null unique key,
 author_id bigint,
 publication_year year,
 genre varchar(100),
 price  decimal(10,2) check(price> 0),
 stock bigint default 0
 );
 
 -- Insert  authors into the Authors table with different nationalities
 INSERT INTO Authors (first_name, last_name, birth_year, nationality) VALUES
('John','Doe',1975,'American'),
('Alice','Walker',1985,'British'),
('Ravi','Kumar',1990,'Indian'),
('Maria','Gomez',1978,'Spanish'),
('David','Smith',1982,'American'),
('Linda','Brown',1988,'Canadian'),
('Oliver','King',1976,'British');


-- viewing the records
select*from Authors;
-- Insert five books into the Books table, ensuring at least two books are by the same author
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) 
VALUES
('Python Basics',1,2020,'Programming',20.00,10);
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) 
VALUES('Python advance',2,2021,'Programming',20.00,10);
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) 
VALUES('java script',1,2022,'languages',20.00,10);
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) 
VALUES('English',3,2021,'languages',20.00,10);
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) 
VALUES('python',5,2025,'Programming',20.00,10);

select*from Books;
-- Write a query to find all books priced between $15 and $25.

select* from books where price between 15 and 25;
select* from books where price > 15 and price < 25;

-- Find all books with either "Python" or "Java" in their title.

select* from books where title like "Python %" or title like "java %";

-- List all authors who were born after 1980 AND are either American or British.

select*from authors
where birth_year > 1980 and nationality in ("american" ,"british");

-- Display all customers who joined in 2023 but haven't placed any orders.

CREATE TABLE Customers (
    customer_id INT auto_increment PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL
);
CREATE TABLE Orders (
    order_id INT  auto_increment PRIMARY KEY,
    customer_id INT,
    book_id bigint,
    order_date DATE NOT NULL,
    quantity INT CHECK (quantity > 0),
    total_amount DECIMAL(10, 2) CHECK (total_amount >= 0),
    foreign key (customer_id) references customers(customer_id),
    foreign key (book_id) references Books(book_id)
);
-- drop table customers;
 -- drop table orders;

select * from customers;
insert into customers(first_name,last_name,email,join_date)
 values("Aman","singh","Aman@123.com", '2022-05-12');
 insert into customers(first_name,last_name,email,join_date)
 values("bineet","verma","binnet@123.com", '2023-02-22');
 insert into customers(first_name,last_name,email,join_date)
 values("chandan","sharma","chandan@123.com", '2022-08-28');
 insert into customers(first_name,last_name,email,join_date)
 values("rohit","sharma","rohit@123.com", '2007-11-04');
 insert into customers(first_name,last_name,email,join_date)
 values("Virat","kholi","virat@123.com", '2001-11-15');
 insert into customers(first_name,last_name,email,join_date)
 values("surya","yadav","surya@123.com", '2025-02-05');
 
 
 INSERT INTO Orders (customer_id, book_id, order_date, quantity, total_amount)
VALUES 
(1, 1, '2023-03-01', 1, 22.99),
(3, 4, '2023-04-15', 2, 35.50),
(5, 2, '2023-05-10', 1, 19.99),
(1, 5, '2023-07-21', 1, 14.99),
(5, 3, '2024-01-05', 1, 25.50);
 select * from orders;
 -- Display all customers who joined in 2023 but haven't placed any orders.
select*from customers
 where year(join_date)=2023 and customer_id not in ( select distinct customer_id from orders);
 
 -- Advanced Questions (JOIN and GROUP BY)
-- Show the total number of books sold for each author, including authors who haven't sold any books.