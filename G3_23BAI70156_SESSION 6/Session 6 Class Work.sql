--Question 1
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    salary INT
);

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Employees (emp_id, emp_name, dept_id, salary) VALUES
(1, 'Asha', 10, 50000),
(2, 'Rohan', 10, 70000),
(3, 'Meera', 20, 40000),
(4, 'Kabir', 20, 55000),
(5, 'Isha', 30, 90000);

INSERT INTO Departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'Finance'),
(30, 'IT');

SELECT D.dept_name, E.emp_name, E.salary, (
SELECT AVG(salary)::NUMERIC(10,0)
FROM Employees
WHERE dept_id = E.dept_id
)AS dept_avg_salary
FROM Departments AS D
LEFT JOIN 
Employees AS E
ON 
D.dept_id = E.dept_id
WHERE E.emp_id = (SELECT emp_id FROM Employees
	WHERE dept_id = E.dept_id
	ORDER BY ABS(salary - (SELECT AVG(salary) FROM Employees WHERE dept_id = E.dept_id)),
	salary DESC
	LIMIT 1
)


--Question 2


CREATE TABLE Persons (
	id INT PRIMARY KEY,
	name VARCHAR(50),
	age INT,
	email VARCHAR(100)
);
INSERT INTO Persons (id, name, age, email) VALUES
(1, 'Rajesh', 28, 'rajesh@gmail.com'),
(2, 'Priya', 25, 'priya@gmail.com'),
(3, 'Suresh', 30, 'rajesh@gmail.com'),
(4, 'Anjali', 24, 'priya@gmail.com');

UPDATE Persons P
SET email = 'duplicate email'
WHERE P.id = (SELECT MAX(P2.id) FROM Persons AS P2
WHERE P2.email = P.email
)
AND P.email IN(SELECT email FROM Persons
GROUP BY email
HAVING COUNT(*) > 1
);

SELECT * FROM Persons
