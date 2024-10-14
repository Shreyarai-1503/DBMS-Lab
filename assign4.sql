student(S_ID, name, dept_name, tot_cred)
instructor(T_ID, name, dept_name, salary)
course(course_id, title, dept_name, credits)
enrollment(S_ID, course_id)


i. Find the average salary of instructor in those departments where the average salary is more than Rs. 42000/-.
select dept_name, AVG(salary) from instructor GROUP BY dept_name HAVING AVG(salary) > 42000;

ii. Increase the salary of each instructor in the computer department by 10%.
update instructor SET salary = salary * 1.10 where dept_name = 'Computer';

iii. Find the names of instructors whose names are neither ‘Amol’ nor ‘Amit’.
select name from instructor where name NOT IN ('Amol', 'Amit');

iv. Find the names of student which contains ‘am’ as its substring.
select name from student where name LIKE '%am%';

v. Find the name of students from computer department that “DBMS” courses they take.
select S.name from student 
JOIN enrollment E ON S.S_ID = E.E_ID
JOIN course C ON E.course_id = C.course_id
where c.title = 'DBMS' AND S.dept_name = 'Computer';