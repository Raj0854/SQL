# SQL


# 📘 SQL (Structured Query Language) 

## 🔹 1. What is SQL?

* SQL stands for **Structured Query Language**
* Used to **store, manage, and retrieve data** from databases
* Works with databases like **MySQL, PostgreSQL, SQL Server, Oracle**

---

## 🔹 2. Types of SQL Commands

### 1. DDL (Data Definition Language)

Used to create or modify database structure

* `CREATE` → create table/database
* `ALTER` → change table structure
* `DROP` → delete table/database
* `TRUNCATE` → delete all data (fast)

---

### 2. DML (Data Manipulation Language)

Used to work with data

* `INSERT` → add data
* `UPDATE` → modify data
* `DELETE` → remove data

---

### 3. DQL (Data Query Language)

* `SELECT` → fetch data from table

---

### 4. DCL (Data Control Language)

* `GRANT` → give permission
* `REVOKE` → remove permission

---

### 5. TCL (Transaction Control Language)

* `COMMIT` → save changes
* `ROLLBACK` → undo changes
* `SAVEPOINT` → set checkpoint

---

## 🔹 3. Basic SQL Syntax

```sql
SELECT column1, column2
FROM table_name
WHERE condition;
```

---

## 🔹 4. Important Clauses

* `WHERE` → filter data
* `ORDER BY` → sort data
* `GROUP BY` → group data
* `HAVING` → filter groups
* `LIMIT` → restrict output

---

## 🔹 5. Operators

* Comparison → `=, >, <, >=, <=, !=`
* Logical → `AND, OR, NOT`
* Special → `IN, BETWEEN, LIKE`

Example:

```sql
SELECT * FROM employees WHERE salary > 50000;
```

---

## 🔹 6. Joins (Very Important in Jobs 🚀)

Used to combine tables:

* `INNER JOIN` → common data
* `LEFT JOIN` → all left + matched
* `RIGHT JOIN` → all right + matched
* `FULL JOIN` → all data

---

## 🔹 7. Keys in SQL

* `PRIMARY KEY` → unique + not null
* `FOREIGN KEY` → link between tables
* `UNIQUE` → no duplicate values

---

## 🔹 8. Indexes

* Used to **speed up queries**

```sql
CREATE INDEX idx_salary ON employees(salary);
```

---

## 🔹 9. Constraints

Rules for data:

* `NOT NULL`
* `UNIQUE`
* `CHECK`
* `DEFAULT`

---

## 🔹 10. Transactions (Real Work Use ⚡)

* Ensure **data safety**
* Example:

```sql
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
```

---

## 🔹 11. Views

* Virtual table (saved query)

```sql
CREATE VIEW emp_view AS
SELECT name, salary FROM employees;
```

---

## 🔹 12. Stored Procedures

* Pre-written SQL code
* Used to **reuse logic**

---

## 🔹 13. Normalization

* Organizing data to avoid duplication
* Makes database efficient

---

## 🔹 14. Real-Life Use of SQL

* Employee management systems
* Banking systems
* E-commerce (orders, users, payments)
* Reports & dashboards
* Data analysis

---



---

