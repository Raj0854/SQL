-- 04-04-2026
use raj;
-- join
show tables; 
select * from customers;
select * from orders;
-- left join
select customers.customer_id, customers.first_name,customers.last_name,orders.order_id,orders.order_date,orders.quantity,orders.total_amount 
from customers left join orders on customers.customer_id = orders.customer_id;
-- right join
select customers.customer_id, customers.first_name,customers.last_name,orders.order_id,orders.order_date,orders.quantity,orders.total_amount 
from customers right join orders on customers.customer_id = orders.customer_id;
-- inner join
select customers.customer_id, customers.first_name,customers.last_name,orders.order_id,orders.order_date,orders.quantity,orders.total_amount 
from customers inner join orders on customers.customer_id = orders.customer_id;
-- full join
select customers.customer_id, customers.first_name,customers.last_name,orders.order_id,orders.order_date,orders.quantity,orders.total_amount 
from customers right join orders on customers.customer_id = orders.customer_id
union
select customers.customer_id, customers.first_name,customers.last_name,orders.order_id,orders.order_date,orders.quantity,orders.total_amount 
from customers left join orders on customers.customer_id = orders.customer_id;

