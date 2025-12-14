--G3_23BAI70156_GAURAV MONGA_SESSION1
CREATE TABLE Employee (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100),
    department VARCHAR(50),
    salary NUMERIC(10,2)
);

INSERT INTO Employee VALUES
(101, 'Gaurav Monga', 'IT', 50000),
(102, 'Avin Mehla', 'HR', 80000),
(103, 'Ashish', 'Finance', 100000);

CREATE VIEW Employee_View AS
SELECT emp_id, emp_name, department
FROM Employee;

CREATE ROLE Analyst;

GRANT SELECT ON Employee_View TO Analyst;
