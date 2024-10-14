CREATE TABLE Employee (
    Eid INT PRIMARY KEY,
    EName VARCHAR(100),
    Address VARCHAR(100),
    Salary NUMBER(10, 2),
    Commission NUMBER(10, 2)
);

CREATE TABLE Project (
    PrNo INT PRIMARY KEY,
    Addr VARCHAR(100)
);

INSERT INTO Employee (Eid, EName, Address, Salary, Commission) VALUES
(1, 'Amit', 'Nasik', 30000, 5000),
(2, 'John', 'Pune', 25000, NULL),
(3, 'Sara', 'Mumbai', 45000, 3000),
(4, 'Anita', 'Nasik', 20000, NULL),
(5, 'Nitin', 'Pune', 35000, 2000),
(6, 'Vikram', 'Mumbai', 60000, NULL),
(7, 'Pooja', 'Chennai', 40000, 1500),
(8, 'Rahul', 'Delhi', 27000, 1000);

INSERT INTO Project (PrNo, Addr) VALUES
(1, 'Mumbai'),
(2, 'Pune'),
(3, 'Nasik'),
(4, 'Delhi');


1.-------------------------------------------------------------------------------------
select DISTINCT Address from Employee;

2.-------------------------------------------------------------------------------------
select MIN(Salary), MAX(Salary) from Employee;

3.-------------------------------------------------------------------------------------
select * from Employee ORDER BY Salary ASC;

4.-------------------------------------------------------------------------------------
select EName from Employee where Address IN ('Pune', 'Nasik');

5.-------------------------------------------------------------------------------------
select EName from Employee where Commission IS NULL;

6.-------------------------------------------------------------------------------------
update Employee SET Address = 'Nashik' where EName = 'Amit';

7.-------------------------------------------------------------------------------------
select * from Employee where EName LIKE 'A%';

8.-------------------------------------------------------------------------------------
select COUNT(*) from Employee where Address = 'Mumbai';

9.-------------------------------------------------------------------------------------
select Address, COUNT(*) from Employee GROUP BY Address;

10.-------------------------------------------------------------------------------------
select Address from Employee where Address IN (select Addr from Project);

11.-------------------------------------------------------------------------------------
select Address, MIN(Salary) from Employee GROUP BY Address;

12.-------------------------------------------------------------------------------------
select Address, MAX(Salary) from Employee GROUP BY Address HAVING MAX(Salary) > 26000;

13.-------------------------------------------------------------------------------------
delete from Employee where Salary > 30000;