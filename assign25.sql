Empl(e_no, e_name, post, pay_rate)
Position(pos_no, post)
Duty_alloc(pos_no, e_no, month, year, shift)
Implement the following SQL queries


--i. Get duty allocation details for e_no 123 for the first shift in the month of April 2003.
select * from Duty_alloc where e_no = 123 and shift = 'first' and month = 'April' and year = 2003;

--ii. Get the employees whose rate of pay is > or equal rate of pay of employees 'Sachin'. 
select e_name from Empl where pay_rate >= (select pay_rate from Empl where ename = 'Sachin');

--iii. Create a view for displaying minimum, maximum and average salary for all the posts. 
Create view emp_details AS select post, min(pay_rate), max(pay_rate), avg(pay_rate) from Empl group by post;

--iv. Get count of different employees on each shift having post ‘manager’.
select d.shift, COUNT(e.e_no) from Empl e
JOIN Duty_alloc d ON e.e_no = d.e_no
where e.post = 'Manager'
group by d.shift;
