-- 09-04-2026
-- useful function
use classicmodels;
select * from customers;
-- count
SELECT COUNT(*) AS total_records
FROM customers;

-- sum 
SELECT SUM(creditlimit) AS total_creditlimit
FROM customers;

-- average
SELECT AVG(creditlimit) AS average_creditlimit
FROM customers;

-- min
SELECT MIN(customername) AS min_name
FROM customers;
SELECT MIN(creditlimit) AS min_creditlimit
FROM customers;

-- max
-- min
SELECT max(customername) AS max_name
FROM customers;
SELECT max(creditlimit) AS max_creditlimit
FROM customers;