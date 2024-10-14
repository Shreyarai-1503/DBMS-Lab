teaches(T_ID, course_id, sec_id, semester, year)
student(S_ID, name, dept_name, tot_cred)
instructor(T_ID, name, dept_name, salary)
course(course_id, title, dept_name, credits)


i. Find the names of the instructor in the university who have taught the courses semester wise.
select DISTINCT i.name from instructor i
JOIN teaches t ON i.T_ID = t.T_ID
ORDER BY t.semester, t.year;

ii. Create View on single table which retrieves student details.
Create VIEW student_detalis AS select * from student;

iii. Rename the column of table student from dept_name to deptartment_name
Alter table student CHANGE dept_name deptartment_name varchar(20);

iv. Delete student name whose department is NULL
Delete from student where deptartment_name IS NULL;

------------------Auto increment-------------------------
ALTER TABLE your_table_name
MODIFY COLUMN column_name INT AUTO_INCREMENT;

ALTER TABLE your_table_name AUTO_INCREMENT = starting_value;


--------------------CONSTRAINTS------------------
ALTER TABLE child_table
ADD CONSTRAINT fk_constraint_name
FOREIGN KEY (child_column)
REFERENCES parent_table(parent_column);

ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE child_table
DROP FOREIGN KEY fk_constraint_name;
