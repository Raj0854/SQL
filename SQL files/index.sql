-- SQL - Indexes
-- SQL - Create Index
-- SQL - Drop Index
-- SQL - Show Indexes
-- SQL - Unique Index
-- SQL - Clustered Index
-- SQL - Non-Clustered Index
-- ==================================================
use indexes;
-- Create the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);


INSERT INTO employees (employee_id, first_name, last_name, email)
VALUES
    (1, 'Amit', 'Kumar', 'amit.kumar@codeswithpankaj.com'),
    (2, 'Priya', 'Sharma', 'priya.sharma@codeswithpankaj.com'),
    (3, 'Rajesh', 'Singh', 'rajesh.singh@codeswithpankaj.com'),
    (4, 'Neha', 'Patel', 'neha.patel@codeswithpankaj.com'),
    (5, 'Sanjay', 'Gupta', 'sanjay.gupta@codeswithpankaj.com'),
    (6, 'Pooja', 'Verma', 'pooja.verma@codeswithpankaj.com'),
    (7, 'Sandeep', 'Yadav', 'sandeep.yadav@codeswithpankaj.com'),
    (8, 'Meera', 'Shah', 'meera.shah@codeswithpankaj.com'),
    (9, 'Vikram', 'Mishra', 'vikram.mishra@codeswithpankaj.com'),
    (10, 'Anita', 'Goyal', 'anita.goyal@codeswithpankaj.com');
    -- ==================================================
-- create index
CREATE  INDEX idx_email ON employees(email);
    -- ==================================================
-- drop index
DROP INDEX idx_email ON employees;


-- ====================================
-- show index
SHOW INDEXES FROM employees;

-- ==================================================
-- unique index
CREATE UNIQUE INDEX idx_unique_email ON employees(email);

