show databases;
use db_name;
create table Customer(C_id int primary key, Cname varchar(15), City varchar(15));
insert into Customer values(1, 'John', 'Nashik');

create table Account(C_id int primary key, Acc_type varchar(10), Amount int);
insert into Account values(1, 'Current', 5000);

1.-------------------------------------------------------------------------------------
select C.Cname, A.Acc_type, A.Amount 
from Customer C
JOIN Account A ON C.C_id = A.C_id
WHERE A.Acc_type = 'Saving';

2.-------------------------------------------------------------------------------------
Natural JOIN
select * from Customer NATURAL JOIN Account;

Left JOIN
select * from Customer C LEFT JOIN Account A ON C.C_id = A.C_id;

Right JOIN
select * from Customer C RIGHT JOIN Account A ON C.C_id = A.C_id;

3.-------------------------------------------------------------------------------------
select * from Customer where City = (select City from Customer where Cname = 'Pooja');

4.-------------------------------------------------------------------------------------
select * from Account where Amount < (select avg(Amount) from Account);

5.-------------------------------------------------------------------------------------
select C_id from Account where Amount = (select max(Amount) from Account);

6.-------------------------------------------------------------------------------------
select Amount, Acc_type from Account where Amount IN (select min(Amount) from Account group by Acc_type);

7.-------------------------------------------------------------------------------------
select Amount from Account WHERE Amount > ANY(select Amount from Account where Acc_type = 'Saving');

OPERATORS FOR SUBQUERIES
ANY - Returns true if the comparison is true for at least one value in the subquery result.
ALL - Returns true only if the comparison is true for all values in the subquery result.
EXISTS - Returns true if the subquery returns one or more rows.
NOT EXISTS - Returns true if the subquery returns no rows
IN