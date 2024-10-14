Create a table emp with following fields and constraints
Eno –(Constraint:- primary key and apply sequence starts with 101) ,
Ename –(Constraint :- notnull) ,
Address –(Constraint :-default ‘Nashik’) ,
Joindate ,

After table creation add field - Post in the emp table.
Insert some data in emp table. 
Create Index on Ename field of employee table.
Create View on employee table to show only Ename and Salary.


create table emp(
    Eno int primary key AUTO_INCREMENT,
    Ename VARCHAR(50) NOT NULL,
    Address VARCHAR(100) default 'Nashik',
    Joindate DATE,
    Salary NUMBER(10, 2)
)AUTO_INCREMENT = 101;


ALTER TABLE emp ADD COLUMN Post VARCHAR(50);

CREATE INDEX emp_idx ON emp(Ename);

CREATE VIEW emp_view AS select Ename, Salary from emp;


------------------Auto increment------------------------------
ALTER TABLE your_table_name
MODIFY COLUMN column_name INT AUTO_INCREMENT;

ALTER TABLE your_table_name AUTO_INCREMENT = starting_value;

--------------------CONSTRAINTS------------------
1. -----------FOREIGN KEY
ALTER TABLE child_table
ADD CONSTRAINT fk_constraint_name
FOREIGN KEY (child_column)
REFERENCES parent_table(parent_column);

ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE child_table
DROP FOREIGN KEY fk_constraint_name;

2. -----------PRIMARY KEY
ALTER TABLE table_name
ADD CONSTRAINT constraint_name 
PRIMARY KEY (column_name);

3.-----------UNIOUE
ALTER TABLE table_name
ADD CONSTRAINT constraint_name 
UNIQUE (column_name);

4.-----------NOT NULL
ALTER TABLE table_name
MODIFY column_name datatype NOT NULL;

5.-----------DEFAULT
ALTER TABLE table_name
ALTER COLUMN column_name 
SET DEFAULT default_value;

6.-----------CHECK
ALTER TABLE table_name
ADD CONSTRAINT constraint_name 
CHECK (condition);

------------------XXXXXXXXXXXXXX--------------------------------
