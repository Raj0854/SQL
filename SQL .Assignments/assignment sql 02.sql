-- =========================================
-- CREATE DATABASE & USE IT
-- =========================================
CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

-- =========================================
-- CREATE TABLES
-- =========================================
-- Q.1 Create the Authors table with appropriate data types and constraints. Make author_id the primary key and ensure first_name and last_name cannot be null.
-- AUTHORS TABLE
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    birth_year INT,
    nationality VARCHAR(50)
);

-- =========================================
-- Q.2-- Create the Books table with:
-- A primary key for book_id
-- A foreign key referencing Authors table
-- A constraint ensuring price is greater than 0
-- A default value of 0 for stock
-- =========================================
-- BOOKS TABLE
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    publication_year INT,
    genre VARCHAR(50),
    price DECIMAL(10,2) CHECK (price > 0),
    stock INT DEFAULT 0,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);
-- =========================================
-- Q.3 Insert three authors into the Authors table with different nationalities.
-- =========================================
-- INSERT DATA
-- 20 AUTHORS
INSERT INTO Authors (first_name, last_name, birth_year, nationality) VALUES
('John','Doe',1975,'American'),
('Alice','Walker',1985,'British'),
('Ravi','Kumar',1990,'Indian'),
('Maria','Gomez',1978,'Spanish'),
('David','Smith',1982,'American'),
('Linda','Brown',1988,'Canadian'),
('Ken','Tanaka',1972,'Japanese'),
('Sara','Miller',1991,'British'),
('Omar','Hassan',1980,'Egyptian'),
('Julia','Roberts',1975,'American'),
('Leon','Adams',1973,'German'),
('Vikram','Singh',1988,'Indian'),
('Chen','Wei',1983,'Chinese'),
('Hiro','Sato',1979,'Japanese'),
('Paula','Fernandez',1985,'Mexican'),
('Mohammed','Ali',1981,'UAE'),
('Eva','Larsen',1989,'Norwegian'),
('Pierre','Dupont',1977,'French'),
('Isabella','Rossi',1984,'Italian'),
('Oliver','King',1976,'British');

-- 30 MORE AUTHORS 
INSERT INTO Authors (first_name, last_name, birth_year, nationality) VALUES
('Sonia','Sharma',1991,'Indian'),
('Arjun','Patel',1987,'Indian'),
('Henry','Clark',1980,'American'),
('Jacob','White',1979,'American'),
('Nina','Lopez',1986,'Spanish'),
('Carlos','Martinez',1990,'Mexican'),
('Yuki','Nakamura',1983,'Japanese'),
('Jin','Park',1985,'Korean'),
('Aisha','Rahman',1988,'Bangladeshi'),
('Tom','Baker',1978,'British'),
('George','Hall',1974,'American'),
('Irina','Petrov',1982,'Russian'),
('Natalia','Smirnova',1987,'Russian'),
('Liam','Scott',1985,'Australian'),
('Noah','Turner',1990,'Australian'),
('Emma','Wright',1993,'Canadian'),
('Maya','Kapoor',1992,'Indian'),
('Zara','Qureshi',1989,'Pakistani'),
('Farhan','Iqbal',1984,'Pakistani'),
('Tariq','Hussein',1976,'Jordanian'),
('Anita','Desai',1958,'Indian'),
('Mark','Wilson',1986,'American'),
('Grace','Young',1991,'British'),
('Hannah','Moore',1983,'Canadian'),
('Samuel','Reed',1980,'American'),
('Austin','Cole',1994,'Australian'),
('Andre','Silva',1987,'Brazilian'),
('Miguel','Castro',1982,'Portuguese'),
('Elena','Costa',1985,'Italian'),
('Jonas','Muller',1981,'German');
-- =========================================
-- Q.4 Insert five books into the Books table, ensuring at least two books are by the same author.
-- =========================================
-- 25  BOOKS
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) VALUES
('Python Basics',1,2020,'Programming',20.00,10),
('Advanced Python Concepts',1,2022,'Programming',25.00,4),
('Java Essentials',2,2021,'Programming',18.50,5),
('Machine Learning 101',3,2023,'AI',30.00,8),
('Deep Learning Guide',3,2022,'AI',40.00,2),
('The Great Adventure',4,2018,'Fiction',12.99,13),
('Love and War',5,2019,'Fiction',15.50,6),
('Secrets of the Universe',6,2020,'Science',22.00,9),
('History of Civilizations',7,2015,'History',18.00,20),
('Fantasy World',8,2017,'Fantasy',16.50,7),
('Cloud Computing',9,2021,'Technology',28.00,3),
('Cyber Security Fundamentals',10,2020,'Technology',32.00,5),
('AI for Beginners',11,2021,'AI',24.99,14),
('Cooking Made Easy',12,2019,'Cooking',12.00,16),
('Master Chef Secrets',13,2022,'Cooking',18.00,5),
('Gardening at Home',14,2021,'Lifestyle',14.00,8),
('Healthy Living',15,2020,'Lifestyle',19.00,11),
('Travel the World',16,2018,'Travel',20.50,4),
('Mountains & Rivers',17,2017,'Travel',21.00,3),
('Digital Photography',18,2021,'Art',26.00,7),
('Painting for All',19,2019,'Art',22.00,9),
('Blockchain Explained',20,2022,'Technology',29.99,6),
('Cryptocurrency Mastery',21,2023,'Technology',34.99,2),
('Big Data Analytics',22,2020,'Technology',27.00,8),
('Physics for Everyone',23,2018,'Science',23.50,15);

-- 25 MORE BASE BOOKS
INSERT INTO Books (title, author_id, publication_year, genre, price, stock) VALUES
('Chemistry Basics',24,2021,'Science',17.50,6),
('Biology Illustrated',25,2022,'Science',19.99,4),
('Space Exploration',26,2023,'Science',28.00,7),
('Programming in C++',27,2021,'Programming',22.50,10),
('Web Development with HTML',28,2020,'Programming',15.99,12),
('Mastering CSS',29,2022,'Programming',17.99,8),
('JavaScript in Depth',30,2023,'Programming',24.99,3),
('PHP & MySQL Guide',31,2021,'Programming',19.50,5),
('Data Structures & Algorithms',32,2020,'Programming',26.50,7),
('Linux for Everyone',33,2022,'Technology',29.50,4),
('Networking Essentials',34,2021,'Technology',21.99,6),
('Mobile App Development',35,2023,'Programming',31.00,3),
('Android Development',36,2021,'Programming',18.50,9),
('iOS Development',37,2022,'Programming',27.50,2),
('Machine Learning Advanced',38,2023,'AI',39.99,4),
('Quantum Computing',39,2022,'Technology',45.00,1),
('Artificial Intelligence Future',40,2023,'AI',35.00,5),
('Romantic Stories',41,2018,'Fiction',11.50,14),
('Horror Night',42,2019,'Fiction',13.00,8),
('Detective Mystery',43,2020,'Fiction',15.00,5),
('Spiritual Awakening',44,2021,'Religion',16.99,6),
('Philosophy of Life',45,2019,'Philosophy',18.99,9),
('Economics Explained',46,2020,'Economics',24.00,7),
('Business Management',47,2022,'Business',29.00,4),
('Startup Guide',48,2021,'Business',19.50,11);


-- =========================================
-- CUSTOMERS TABLE
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name  VARCHAR(50),
    email VARCHAR(100),
    join_date DATE
);

-- ORDERS TABLE
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    book_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

--  INSERT 20  CUSTOMERS 
INSERT INTO Customers (first_name, last_name, email, join_date) VALUES
('Amit','Sharma','amit1@mail.com','2022-01-10'),
('Riya','Mehta','riya2@mail.com','2023-02-14'),
('John','King','john3@mail.com','2021-05-20'),
('Karan','Patel','karan4@mail.com','2020-08-11'),
('Sneha','Kapoor','sneha5@mail.com','2023-03-19'),
('Pooja','Iyer','pooja6@mail.com','2022-09-21'),
('Rahul','Singh','rahul7@mail.com','2021-11-23'),
('Mohan','Das','mohan8@mail.com','2020-10-12'),
('Preeti','Nair','preeti9@mail.com','2023-01-05'),
('Daniel','Jones','dan10@mail.com','2022-04-17'),
('Sophia','Brown','soph11@mail.com','2023-01-30'),
('Emma','Wilson','emm12@mail.com','2022-06-21'),
('Oliver','Scott','oli13@mail.com','2021-03-27'),
('Lucas','Walker','luc14@mail.com','2021-07-14'),
('Noah','Adams','noah15@mail.com','2023-02-11'),
('Arjun','Khurana','arj16@mail.com','2020-01-11'),
('Kabir','Rathod','kab17@mail.com','2021-02-05'),
('Sanjay','Shah','san18@mail.com','2022-10-10'),
('Deepa','Joshi','deep19@mail.com','2023-04-09'),
('Zoya','Ali','zoy20@mail.com','2020-12-12');

-- INSERT 20  ORDERS
INSERT INTO Orders (customer_id, book_id, order_date, quantity, total_amount) VALUES
(1,1,'2023-01-10',2,40.00),
(2,3,'2023-03-15',1,18.50),
(3,5,'2022-07-20',1,40.00),
(4,2,'2021-09-11',3,75.00),
(5,10,'2023-04-19',2,52.00),
(6,7,'2022-10-21',1,15.50),
(7,12,'2021-12-23',1,32.00),
(8,4,'2020-11-12',2,60.00),
(9,6,'2023-02-05',1,12.99),
(10,8,'2022-05-17',2,44.00),
(11,15,'2023-02-28',1,18.00),
(12,20,'2022-08-22',1,26.00),
(13,25,'2021-04-01',2,47.00),
(14,30,'2021-08-18',1,24.99),
(15,40,'2023-02-11',3,105.00),
(16,45,'2020-01-11',1,18.99),
(17,48,'2021-02-05',2,39.00),
(18,50,'2022-10-10',1,31.50),
(19,11,'2023-04-09',1,24.99),
(20,19,'2020-12-12',1,21.00);
-- =========================================
--  VIEW THE RECORDS
select * from authors;
select * from customers;
select * from books;
select * from orders;

-- =========================================
-- Q.5 Write a query to find all books priced between $15 and $25.
-- =========================================
SELECT * FROM BOOKS WHERE PRICE between 15 AND 25;
-- =========================================
-- Q.6 Find all books with either "Python" or "Java" in their title.
-- =========================================
SELECT * FROM BOOKS WHERE TITLE LIKE "%Python%" OR TITLE LIKE "%Java%";
-- =========================================
-- Q.7 List all authors who were born after 1980 AND are either American or British.
-- =========================================
SELECT * FROM AUTHORS WHERE birth_year > 1980 AND NATIONALITY = "American" or NATIONALITY ="British";
-- =========================================
-- Q.8 Display all customers who joined in 2023 but haven't placed any orders.
-- =========================================
INSERT INTO CUSTOMERS(first_name, last_name, email, join_date) VALUES('ZAYEN','Ali','zoy20@mail.com','2023-12-12');
SELECT * FROM CUSTOMERS where year(join_date)= 2023 and customer_id not in (select distinct customer_id from orders) ;
-- =========================================
-- Q.9 Show the total number of books sold for each author, including authors who haven't sold any books.
-- =========================================
Select a.author_id,
a.first_name,
a.last_name,
b.book_id, 
coalesce(sum(o.quantity),0)
as total_book_sold
from authors a left join books b on a.author_id = b.author_id
left join orders o on  o.book_id=b.book_id 
group by a.author_id,
a.first_name,
a.last_name ,
b.book_id
order by total_book_sold desc;
-- =========================================
-- Q.10 Find the top 3 customers who have spent the most money on books, showing their name and total spending.
-- =========================================
SELECT C.CUSTOMER_ID,
C.first_name,
C.last_name,
coalesce(sum(o.total_amount),0) as total_spending
from customers c left join orders o on o.customer_id = c.customer_id 
group by
C.CUSTOMER_ID,
C.first_name,
C.last_name
order by total_spending desc
limit  3;
-- =========================================
-- Q.11 List all books along with their authors' names where the book's price is above the average book price.
-- =========================================
SELECT b.book_id,
b.title,
a.first_name,
a.last_name,
b.price
from books b left join authors a on a.author_id=  b.author_id
where b.price > (select avg(price) from books);
-- =========================================
-- Q.12 Show each genre and the number of books in that genre, but only for genres with more than 3 books.
-- =========================================
SELECT genre,count(*) as number_of_books from books  group by genre having count(*)> 3;
-- =========================================
-- Q.13 Update the prices of all books in a specific genre by increasing them by 10%, but only if the current stock is less than 5.
-- =========================================
update books set price= (price + (price*10/100)) where genre = "programming" and stock <5 ;
-- =========================================
-- VIEWING PURPOSE DOES NOT UPDATE TABLE
-- =========================================
select title, genre , (price + (price*10/100)) as updated_price from books where genre = "AI" and stock <5 ;
-- =========================================
-- Q.14 Delete all orders that are more than a year old AND have a total_amount less than $20.
-- =========================================
SELECT *FROM ORDERS;
DELETE FROM ORDERS WHERE total_amount < 20 and  date(order_date)< subdate( curdate(),interval 1 year);
-- =========================================
-- Q.15 Find authors who have written books in at least 3 different genres.
-- =========================================
SELECT a.author_id,
a.first_name,
a.last_name
from authors a left join books b on a.author_id= b.author_id
group by a.author_id,a.first_name, a.last_name
having count( distinct b.genre) >=3;

-- =========================================
-- Q.16 Create a summary showing for each month of 2023:
-- Total number of orders
-- Total revenue
-- Best-selling book (by quantity)
-- Number of unique customers
-- =========================================
-- =========================================
