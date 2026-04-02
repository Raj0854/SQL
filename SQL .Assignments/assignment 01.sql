-- Scenario:
-- Assume you have a database named Company with a table named Employees. The Employees table has the following columns:

-- EmployeeID (integer, primary key)
-- FirstName (varchar)
-- LastName (varchar)
-- Department (varchar)
-- Salary (numeric)
-- Tasks:

-- Insert Data:

-- Insert a new employee with the following details:
-- EmployeeID: 101
-- FirstName: 'John'
-- LastName: 'Doe'
-- Department: 'IT'
-- Salary: 60000
-- Update Data:

-- Update the salary of the employee with EmployeeID 101 to 65000.
-- Delete Data:

-- Delete the employee with EmployeeID 101 from the Employees table.

show databases;
create database company;
use company;
create table employee(
EmployeeID int primary key,
FirstName varchar(50),
LastName varchar(50),
Department varchar(100),
Salary decimal(10,2)
);

insert into employee values(101,"john","doe","It",60000);

update employee set salary=65000 where EmployeeID = 101;

delete from employee where EmployeeID = 101;