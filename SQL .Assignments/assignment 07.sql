  -- ==========================================
 CREATE DATABASE OFFICE;
 USE OFFICE;
 -- ==========================================
 -- CREATE TABLES EMPLOYEES, DEPARTMENTS,PROJECTS.Employee_Project
 -- ==========================================
 CREATE TABLE EMPLOYEES(
 EMPID INT primary key,
 firstname varchar(100),
 lastname varchar(100),
 department varchar(100),
 salary decimal(10,2),
 hire_date date);
 
 CREATE TABLE DEPARTMENTS(
 DEPARTMENTID INT PRIMARY KEY,
 DEPARTMENTNAME varchar(100),
 LOCATION VARCHAR(100));
 
 CREATE TABLE PROJECTS(
 PROJECTID INT primary key,
 PROJECTNAME VARCHAR(100),
 DEPARTMENTID INT,
foreign key (DEPARTMENTID) references DEPARTMENTS(DEPARTMENTID));

create TABLE Employee_Project(
EMPID INT,
PROJECTID INT,
HOURS_WORKED decimal(5,2),
foreign key (PROJECTID) references PROJECTS(PROJECTID),
foreign key (EMPID) references EMPLOYEES(EMPID)
);
 
 -- ==========================================
 -- INSERT DATA
 -- ==========================================
 INSERT INTO Departments VALUES
(1, 'HR', 'Mumbai'),
(2, 'IT', 'Pune'),
(3, 'Finance', 'Delhi'),
(4, 'Marketing', 'Bangalore');
 -- ==========================================
 INSERT INTO Employees VALUES
(101, 'Amit', 'Sharma', 'HR', 50000.00, '2022-01-15'),
(102, 'Priya', 'Verma', 'IT', 80000.00, '2021-06-10'),
(103, 'Rahul', 'Mehta', 'Finance', 75000.00, '2020-03-20'),
(104, 'Sneha', 'Patil', 'IT', 82000.00, '2023-02-05'),
(105, 'Arjun', 'Reddy', 'Marketing', 60000.00, '2021-11-12'),
(106, 'Neha', 'Kapoor', 'HR', 52000.00, '2022-08-01');
 INSERT INTO Employees VALUES
(108, 'Arun', 'Reddy', 'Marketing', 60000.00, '2022-11-12'),
(107, 'sneha', 'singh', 'IT', 52000.00, '2026-03-01');
 -- ==========================================
 INSERT INTO Projects VALUES
(201, 'HR System Upgrade', 1),
(202, 'Website Development', 2),
(203, 'Financial Audit', 3),
(204, 'Ad Campaign', 4),
(205, 'Mobile App', 2);
 -- ==========================================
 INSERT INTO Employee_Project VALUES
(101, 201, 120.50),
(106, 201, 95.00),
(102, 202, 150.00),
(104, 202, 170.25),
(103, 203, 130.75),
(105, 204, 110.00),
(102, 205, 140.00),
(104, 205, 160.00);
 -- ==========================================
 SELECT * FROM EMPLOYEES;
 SELECT * FROM PROJECTS;
 SELECT * FROM DEPARTMENTS;
 SELECT * FROM EMPLOYEE_PROJECT;
 -- ==========================================
 
--  Q.1 Write a query to find the employee with the highest salary in each department.
 -- ==========================================
SELECT * from EMPLOYEES E where SALARY =(SELECT MAX(SALARY) from EMPLOYEES where DEPARTMENT = E.DEPARTMENT);
 -- ==========================================
-- Q.2 Write a query to find the department with the highest number of employees.
 -- ==========================================
SELECT Department, COUNT(*) AS EmployeeCount FROM Employees GROUP BY Department
ORDER BY EmployeeCount DESC LIMIT 1;
 -- ==========================================
--  Q.3 Write a query to calculate the average salary for each department.
 -- ==========================================
 SELECT DEPARTMENT, AVG(SALARY) FROM EMPLOYEES group by DEPARTMENT;
 -- ==========================================
--  Q.4 Write a query to find all employees who joined the company in the last 6 months.
 -- ==========================================
 SELECT * FROM EMPLOYEES WHERE hire_date > (subdate(curdate(), interval 6 month));
 -- ==========================================
 -- Q.5  Write a query to list all the projects along with the department name they belong to.
 -- ==========================================
 select p.projectid,p.projectname,d.departmentname from
 projects p join departments d on p.departmentid = d.departmentid order by p.projectid;
 -- ==========================================
 -- Q.6 Write a query to find the total hours worked by each employee on all projects combined.
 -- ==========================================
 SELECT E.EMPID,E.FIRSTNAME, E.LASTNAME, SUM(EP.HOURS_WORKED) AS TOTAL_HOURS FROM 
 EMPLOYEES E JOIN Employee_Project EP ON E.EMPID=EP.EMPID group by E.EMPID;
 -- ==========================================
 -- Q.7 Write a query to find all employees who are not assigned to any project.
 -- ==========================================
 SELECT * FROM EMPLOYEES WHERE EMPID NOT IN (SELECT EMPID FROM Employee_Project );
 -- ==========================================
 -- Q.8 Write a query to find all employees who are working on more than one project.
 -- ==========================================
 SELECT * FROM EMPLOYEES WHERE EMPID  IN (SELECT EMPID FROM Employee_Project group by EMPID HAVING COUNT(EMPID)>1) ;
 -- ==========================================
--  Q.9 Write a query to find the department with the highest total hours worked on all projects.
 -- ==========================================
 SELECT D.DEPARTMENTNAME, SUM(EP.HOURS_WORKED)AS TOTAL_HOURS FROM DEPARTMENTS D JOIN PROJECTS P ON 
 D.DEPARTMENTID = P.DEPARTMENTID JOIN Employee_Project EP ON EP.PROJECTID= P.PROJECTID group by D.DEPARTMENTNAME
 order by TOTAL_HOURS DESC LIMIT 1;
 -- ==========================================
 -- Q.10 Write a query to update the salaries of all employees in a specific department (e.g., 'IT') by 10%.
 -- ==========================================
 SELECT *,(SALARY +(SALARY*10/100)) AS UPDATED_SALARY FROM EMPLOYEES WHERE DEPARTMENT="IT";
 -- ==========================================
 -- Q.11 Write a query to list all employees along with the names of the projects they are working on.
 -- If an employee is not working on any project, still include them in the list with a NULL project name.
 -- ==========================================
 SELECT E.EMPID,E.FIRSTNAME, E.LASTNAME ,P.PROJECTNAME
 FROM EMPLOYEES E LEFT JOIN EMPLOYEE_PROJECT EP ON E.EMPID = EP.EMPID
 LEFT JOIN PROJECTS P ON EP.PROJECTID = P.PROJECTID;
 -- ==========================================
 -- Q.12 Write a query to find employees who work in the same department and have the same salary.
 -- ==========================================
 SELECT e.*
FROM Employees e
JOIN (SELECT DEPARTMENT,SALARY FROM EMPLOYEES group by DEPARTMENT,SALARY having COUNT(*)>1) 
DUP ON E.DEPARTMENT = dup.Department AND e.Salary = dup.Salary;
 -- ==========================================
-- Q.13 Write a query to find the top 3 highest-paid employees in the company.
 -- ==========================================
 SELECT  FIRSTNAME, LASTNAME, SALARY FROM EMPLOYEES order by SALARY DESC LIMIT 3;
 -- ==========================================
--  Q.14 Write a query to find the department with the longest-serving employees (based on the earliest hire_date).
 -- ==========================================
SELECT Department, MIN(Hire_Date) AS EarliestHireDate
FROM Employees
GROUP BY Department
ORDER BY EarliestHireDate ASC limit 1;
 -- ==========================================
--  Q.15  Write a query that generates a report showing the employees name,
--  department, and the total number of projects they are participating in.
 -- ==========================================
 select e.empid,e.firstname, e.lastname,e.department, count(p.projectid) as  total_projects from
 employees e join Employee_Project ep on e.empid =ep.empid join projects p  on ep.projectid=p.projectid 
 group by e.empid order by e.empid;