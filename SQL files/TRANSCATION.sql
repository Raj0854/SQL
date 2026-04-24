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

