-- 07-04-2026
-- having 

use classicmodels;
select*from customers;
select country, sum(creditlimit) as total_creditlimit,
sum(creditlimit) +((sum(creditlimit))*10/100) as with_tax_amt from customers group by (country) having total_creditlimit > 500000;
-- view
-- create view
create view q1 as 
select country, sum(creditlimit) as total_creditlimit,
sum(creditlimit) +((sum(creditlimit))*10/100) as with_tax_amt from customers group by (country) having total_creditlimit > 500000;

-- call view
select * from q1;

