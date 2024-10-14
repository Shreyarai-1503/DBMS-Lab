Emp(emp_id,ename, street, city)
works(emp_id,c_id,ename, cname, sal)
Company(c_id,cname, city)
Manager(mgr_id, mgrname)


--i. Modify the database so that a particular company (eg. ABC) now in Pune
UPDATE Company SET city = 'Pune' where cname = 'ABC';

--ii. Give all managers of Mbank a 10% raise. If salary is >20,000, give only 3% raise.
UPDATE Manager m 
JOIN works w ON m.mgr_id = w.emp_id
JOIN Company c ON w.c_id = c.c_id
SET e.sal = CASE 
    WHEN w.sal > 20000 THEN w.sal*1.03
    ELSE w.sal*1.10
END
WHERE c.cname = 'MBank';

--iii. Find out the names of all the employees who works in ‘Bosch’ company in city Pune 
select E.ename from Emp
JOIN works W on W.emp_id = E.emp_id
JOIN Company C on C.c_id = W.c_id
where C.cname = 'Bosch' and C.city = 'Pune';

--iv. Delete all records in the works table for employees of a particular company (Eg, SBC Company) whose salary>50,000.
Delete from works WHERE c_id = (select c_id from Company where cname = 'SBC') and sal > 50000;