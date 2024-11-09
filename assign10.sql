Account(Acc_no, branch_name,balance)
branch(branch_name,branch_city,assets)
customer(cust_name,cust_street,cust_city)
Depositor(cust_name,acc_no)
Loan(loan_no,branch_name,amount)
Borrower(cust_name,loan_no)

Solve following query:

-- Create above tables with appropriate constraints like primary key, foreign key, check constrains, not null etc.
CREATE TABLE Account (
    Acc_no INT PRIMARY KEY,
    branch_name VARCHAR(50) NOT NULL,
    balance DECIMAL CHECK (balance >= 0),
    FOREIGN KEY (branch_name) REFERENCES branch(branch_name)
);

CREATE TABLE branch (
    branch_name VARCHAR(50) PRIMARY KEY,
    branch_city VARCHAR(50) NOT NULL,
    assets DECIMAL CHECK (assets >= 0)
);

CREATE TABLE customer (
    cust_name VARCHAR(50) PRIMARY KEY,
    cust_street VARCHAR(50) NOT NULL,
    cust_city VARCHAR(50) NOT NULL
);

CREATE TABLE Depositor (
    cust_name VARCHAR(50),
    acc_no INT,
    PRIMARY KEY (cust_name, acc_no),
    FOREIGN KEY (cust_name) REFERENCES customer(cust_name),
    FOREIGN KEY (acc_no) REFERENCES Account(Acc_no)
);

CREATE TABLE Loan (
    loan_no INT PRIMARY KEY,
    branch_name VARCHAR(50) NOT NULL,
    amount DECIMAL CHECK (amount >= 0),
    FOREIGN KEY (branch_name) REFERENCES branch(branch_name)
);

CREATE TABLE Borrower (
    cust_name VARCHAR(50),
    loan_no INT,
    PRIMARY KEY (cust_name, loan_no),
    FOREIGN KEY (cust_name) REFERENCES customer(cust_name),
    FOREIGN KEY (loan_no) REFERENCES Loan(loan_no)
);

-- Q1. Find the names of all branches in loan relation.
SELECT DISTINCT branch_name FROM Loan;

-- Q2. Find all loan numbers for loans made at Akurdi Branch with loan amount > 12000.
SELECT loan_no FROM Loan WHERE branch_name = 'Akurdi' AND amount > 12000;

-- Q3. Find all customers who have a loan from bank. Find their names,loan_no and loan amount.
SELECT b.cust_name, b.loan_no, l.amount FROM Borrower b JOIN Loan l ON b.loan_no = l.loan_no;

-- Q4. List all customers in alphabetical order who have loan from Akurdi branch.
SELECT b.cust_name FROM Borrower b 
JOIN Loan l ON b.loan_no = l.loan_no 
WHERE l.branch_name = 'Akurdi' ORDER BY b.cust_name;

-- Q5. Find all customers who have an account or loan or both at bank.
SELECT DISTINCT c.cust_name FROM customer c
LEFT JOIN Depositor d ON c.cust_name = d.cust_name
LEFT JOIN Borrower b ON c.cust_name = b.cust_name
WHERE d.cust_name IS NOT NULL OR b.cust_name IS NOT NULL;

-- Q6. Find all customers who have both account and loan at bank.
SELECT DISTINCT c.cust_name FROM customer c
JOIN Depositor d ON c.cust_name = d.cust_name
JOIN Borrower b ON c.cust_name = b.cust_name;

-- Q7. Find all customer who have account but no loan at the bank.
SELECT DISTINCT c.cust_name FROM customer c
JOIN Depositor d ON c.cust_name = d.cust_name
LEFT JOIN Borrower b ON c.cust_name = b.cust_name
WHERE b.loan_no IS NULL;

-- Q8. Find average account balance at Akurdi branch.
SELECT AVG(balance) AS avg_balance FROM Account WHERE branch_name = 'Akurdi';

-- Q9. Find the average account balance at each branch
SELECT branch_name, AVG(balance) FROM Account GROUP BY branch_name;

-- Q10. Find no. of depositors at each branch.
SELECT a.branch_name, COUNT(DISTINCT d.cust_name) AS no_of_depositors
FROM Depositor d
JOIN Account a ON d.acc_no = a.Acc_no
GROUP BY a.branch_name;

-- Q11. Find the branches where average account balance > 12000.
SELECT branch_name FROM Account GROUP BY branch_name HAVING AVG(balance) > 12000;
