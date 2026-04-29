  -- Create a database named CompanyDB and add the following tables:

show databases;
create database companyDB;
use companyDB;
show tables;
create table department(
department_id int primary key,
department_name varchar(100)
);
create table employees(
empID INT primary key,
firstname varchar(50),
lastname varchar(50),
age int,
salary decimal(10,2),
department_id int, 
foreign key (department_id) references department(department_id),
joining_date date
);
-- Insert at least 3 records into the Departments table and at least 10 records into the Employees table with different details.
insert into department values(111,"sales");
insert into department values(222,"IT");
insert into department values(333,"Marketing");
select*from department;

insert into employees values(1,"aman","mishra",22,12500,111,"2026-02-22");
insert into employees values(2,"ajay","gill",21,20550,222,"2026-02-21");
insert into employees values(3,"bineet","kumar",20,14844,333,"2026-05-22");
insert into employees values(4,"vishal","mishra",25,16500,111,"2026-12-22");
insert into employees values(5,"manish","gupta",22,19000,222,"2026-07-22");
insert into employees values(6,"manoj","sharma",27,18000,333,"2026-03-22");
insert into employees values(7,"kisan","rajbhar",25,13500,333,"2026-11-22");
insert into employees values(8,"karan","pal",29,14500,222,"2026-09-22");
insert into employees values(9,"ashwin","updhaya",32,17500,222,"2026-04-22");
insert into employees values(10,"chandan","yadav",28,15000,111,"2026-06-22");
insert into employees values(11,"chandan","JADHAV",28,15000,111,"2022-06-22");
insert into employees values(12,"VIKAS","RAJKUMAR",45,25000,111,"2009-06-22");
insert into employees values(13,"akash","rai",42,250000,222,"2009-06-22");

select*from employees;

-- ============================================================
-- Q.1 Write a query to display all employees along with their department names.
-- ============================================================
select e.empID,e.firstname,e.lastname,d.department_id, d.department_name from employees e left join department d on e.department_id= d.department_id group by e.empID ;

-- ============================================================
-- Q.2 Write a query to calculate the average salary of employees in each department
-- ============================================================
SELECT d.department_id,d.department_name,avg(e.salary)as average_salary from employees e left join department d on e.department_id= d.department_id group by d.department_id;

-- ============================================================
-- Q.3 Write a query to display all employees who have joined in the last 2 years
-- ============================================================
SELECT  * FROM EMPLOYEES WHERE JOINING_DATE > subdate(curdate(),intervaL 2 YEAR);

-- ============================================================
-- Q.4 Write a query to find the department with the highest number of employees
-- ============================================================
SELECT d.department_name, count(*)  as number_of_emp from employees e left join department d on e.department_id= d.department_id group by d.department_id order by number_of_emp desc limit 1 ;
-- ============================================================
-- Q.5 Update the salary of employees whose age is greater than 40 by increasing it by 10%.
-- ============================================================
select empID,firstname, lastname, age, salary, (salary+(salary*10/100)) as updated_salary FROM EMPLOYEES where age > 40;
-- ============================================================
-- Q.6 Write a query to delete all employees from the department named 'Sales'.
-- ============================================================
-- delete employees.*, department.departmentName from employees E left join departments D on E.department_id= d.department_id WHERE department.departmentname='Sales';
SELECT * FROM EMPLOYEES E LEFT JOIN department D ON E.department_id= D.department_id WHERE D.department_name='Sales';

-- ============================================================
-- Q.7 Create a view named HighEarnerEmployees that displays the EmployeeID, FirstName, LastName, and Salary of employees earning more than 100000.
-- ============================================================
create view HighEarnerEmployees as select empId, FirstName, LastName, Salary from employees where salary > 100000;
select * from HighEarnerEmployees;
-- ============================================================
-- Q.8 Write a query using a common table expression (CTE) to find employees who report to the same department and have salaries greater than the average salary of that department.
-- ============================================================
SELECT e.firstname, e.lastname,d.department_id,d.department_name,avg(e.salary)as average_salary 
from employees e left join department d on e.department_id= d.department_id 
where e.salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE Department_ID = e.Department_ID
) group by d.department_id,e.firstname, e.lastname,d.department_name;
-- ============================================================
