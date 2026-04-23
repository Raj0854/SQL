-- 1. Creating Tables:
-- Create a database named EmployeeManagement.
-- *******************************************************************
CREATE database IF NOT EXISTS EmployeeManagement;
USE EmployeeManagement;
-- *******************************************************************
-- Inside this database, create the following tables:
-- Employee:
-- EmployeeID (Primary Key, Integer)
-- FirstName (Text, not NULL)
-- LastName (Text, not NULL)
-- DOB (Date)
-- HireDate (Date)
-- DepartmentID (Foreign Key, Integer)
-- Salary (Decimal)
-- *******************************************************************
create TABLE EMPLOYEE(
EMPID INT primary key,
FIRSTNAME VARCHAR(100) NOT NULL,
LASTNAME VARCHAR(100) NOT NULL,
DOB DATE,
HIREDATE DATE,
DEPTID INT,
SALARY decimal(10,2),
foreign key (DEPTID) references DEPARTMENTS(DEPTID)
);
-- *******************************************************************
-- Department:
-- DepartmentID (Primary Key, Integer)
-- DepartmentName (Text, not NULL)
-- *******************************************************************
CREATE TABLE DEPARTMENTS(
DEPTID INT primary KEY,
DEPTNAME VARCHAR(100) not null
);
-- *******************************************************************
-- Task:
-- Q.1 Write SQL queries to:
-- Insert at least 5 records into each table.
-- *******************************************************************
INSERT INTO DepartmentS (DeptID, DepTName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations');
-- *******************************************************************
INSERT INTO Employee (EmpID, FirstName, LastName, DOB, HireDate, DeptID, Salary) VALUES
(101, 'Amit', 'Sharma', '1990-05-10', '2022-01-15', 1, 50000.00),
(102, 'Priya', 'Verma', '1992-08-20', '2021-06-10', 2, 80000.00),
(103, 'Rahul', 'Mehta', '1988-03-25', '2020-03-20', 3, 75000.00),
(104, 'Sneha', 'Patil', '1995-11-12', '2023-02-05', 2, 82000.00),
(105, 'Arjun', 'Reddy', '1991-07-18', '2021-11-12', 4, 60000.00);
-- *******************************************************************
-- Q.2 Write SQL queries to:
-- Retrieve all employees' FirstName, LastName, and Salary.
-- Retrieve employees who were hired after January 1, 2020.
-- Retrieve employees with a salary greater than 50000.
-- *******************************************************************
select FIRSTNAME, LASTNAME , SALARY FROM EMPLOYEE;
select * FROM EMPLOYEE WHERE HIREDATE > '2020-01-01';
select * FROM EMPLOYEE WHERE SALARY > 50000;
-- *******************************************************************
-- Q.3 Retrieve a list of employees along with their department names using an inner join.
-- *******************************************************************
select E.*, D.DEPTNAME FROM EMPLOYEE E  INNER JOIN DEPARTMENTS D ON E.DEPTID=D.DEPTID;
-- *******************************************************************
-- Q.4 List all departments along with the total number of employees in each department
--  (use LEFT JOIN to include departments without employees)
-- *******************************************************************
select D.DEPTNAME,COUNT(E.EMPID)AS TOTAL_NUMBER 
FROM DEPARTMENTS D  LEFT JOIN EMPLOYEE E ON E.DEPTID= D.DEPTID group by D.DEPTNAME;
-- *******************************************************************
-- Q.5 Find the average salary of employees in each department.
-- *******************************************************************
select D.DEPTNAME,avg(E.SALARY)AS AVG_SALARY
FROM DEPARTMENTS D   JOIN EMPLOYEE E ON E.DEPTID= D.DEPTID group by D.DEPTNAME;
-- *******************************************************************
-- Q.6 Get the maximum and minimum salary of employees in the entire company.
-- *******************************************************************
SELECT MIN(SALARY)AS MIN_SALARY, MAX(SALARY)AS MAX_SALARY FROM EMPLOYEE;
-- *******************************************************************
-- Q.7 Retrieve employees whose salary is above the company’s average salary.
-- *******************************************************************
SELECT * FROM EMPLOYEE WHERE SALARY>(SELECT AVG(SALARY) FROM EMPLOYEE );
-- *******************************************************************
-- Q.8 Retrieve the department(s) with the highest total salary.
-- *******************************************************************
select D.DEPTNAME,SUM(E.SALARY)AS HIGHEST_TOTAL_SALARY
FROM DEPARTMENTS D  LEFT JOIN EMPLOYEE E ON E.DEPTID= D.DEPTID 
group by D.DEPTNAME order by HIGHEST_TOTAL_SALARY DESC LIMIT 1 ;
-- *******************************************************************
-- Q.9 Retrieve employees who have been with the company for more than 5 years.
-- *******************************************************************
select * FROM EMPLOYEE WHERE HIREDATE < (subdate(CURDATE(),interval 5 year));
-- *******************************************************************
-- Q.10 List employees who were hired in the same year as another employee (use a self-join).
-- *******************************************************************
SELECT e1.*,YEAR(e1.HireDate) AS HireYear FROM Employee e1
JOIN Employee e2 ON YEAR(e1.HireDate) = YEAR(e2.HireDate) AND e1.EmpID <> e2.EmpID
ORDER BY HireYear;
-- *******************************************************************
-- Q.11 Create a view named EmployeeDetails that contains employee names, department names, and salaries.
-- *******************************************************************
create view EmployeeDetails AS select E.FIRSTNAME,E.LASTNAME,D.DEPTNAME,E.SALARY FROM EMPLOYEE E
LEFT JOIN DEPARTMENTS D ON E.DEPTID = D.DEPTID;
SELECT * FROM EmployeeDetails;
-- *******************************************************************
-- Q.12 Write a query to retrieve data from the EmployeeDetails view for employees with a salary greater than 60000.
-- *******************************************************************
SELECT * FROM EmployeeDetails WHERE SALARY > 60000;
-- *******************************************************************
-- Q.13 Scenario:
-- You are adding a new department and transferring an employee from one department to another.
--  Ensure this process happens atomically.
-- *******************************************************************
-- Task:
-- Start a transaction.
-- Insert a new department named Research.
-- Update an employee's DepartmentID to the newly created Research department.
-- Commit the transaction.
-- *******************************************************************
START transaction;
INSERT INTO DEPARTMENTS(DEPTID,DEPTNAME) values(6,"RESEARCH");
update EMPLOYEE SET DEPTID = 6 WHERE EMPID= 104;
COMMIT;
SELECT*FROM EMPLOYEE;
-- ******************************************************************
-- 4. Indexing:
-- Task:
-- Create an index on the Salary column of the Employee table to optimize salary-based queries.
-- ******************************************************************

CREATE INDEX idx_employee_salary
ON Employee (Salary);

