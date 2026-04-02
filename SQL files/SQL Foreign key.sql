-- 31-03-2026
-- foreign key is the which represent the relation with other tables.
show databases;
use raj;
show tables;
select* from employee;
-- creating foreign key in salary tables
create table salary(
id int primary key,
month varchar(100),
amount bigint,
foreign key (id) references employee(id)
);
-- dependent table need main table key
insert into salary values(101,"march",12100);
insert into salary values(102,"april",21000);
insert into salary values(103,"may",15500);
insert into salary values(104,"feb",54200);
select * from salary;