-- Scenario:
-- Assume you have a database named Library with two tables: Books and Authors. The tables have the following structures:

-- Books table:
-- BookID (integer, primary key)
-- Title (varchar)
-- AuthorID (integer, foreign key referencing Authors table)
-- PublicationYear (integer)
-- Available (boolean)

-- Authors table:
-- AuthorID (integer, primary key)
-- AuthorName (varchar)
-- BirthYear (integer)
-- ==================================================================================================

show databases;
create database aasignment02;
use aasignment02;

create table Authors(
AuthorID int primary key,
Authorname varchar(100),
birthyear year
);
create table books(
bookid int primary key,
Title varchar(100),
AuthorID int,
PublicationYear int,
Available boolean,
foreign key (AuthorID) references Authors(AuthorID)
);
-- ==================================================================================================
-- Tasks:
-- ==================================================================================================

-- Insert Data:

-- Insert a new author with the following details:
-- AuthorID: 201
-- AuthorName: 'Jane Smith'
-- BirthYear: 1980
-- ==================================================================================================
insert into Authors value(201,"jane smith",1980);
insert into Authors value(202,"steve foster",1984);
insert into Books  value(101,"God of thunder",201,2007,true);
insert into Books  value(102,"God of death",201,2005,true);
insert into Books  value(103,"magic mastery",202,2009,true);
insert into Books  value(104,"heart of iron",202,2001,true);
-- ==================================================================================================

-- Update Data:

-- Update the publication year of the book with BookID 101 to 2020.
-- ==================================================================================================
update books set PublicationYear=2020 where Bookid=101;
-- ==================================================================================================
-- Delete Data:
-- Delete all books published before the year 2000 from the Books table.
-- ==================================================================================================
delete  from books where PublicationYear < 2000;	
