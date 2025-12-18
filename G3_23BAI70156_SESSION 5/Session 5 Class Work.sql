--Question 1
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Location VARCHAR(50)
);


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    DeptID INT,
    Salary INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);


INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(10, 'HR', 'Delhi'),
(20, 'IT', 'Mumbai'),
(30, 'Finance', 'Pune'),
(50, 'Marketing', 'Chennai');

INSERT INTO Employees (EmpID, EmpName, DeptID, Salary) VALUES
(1, 'Akash', 10, 50000),
(2, 'Nisha', 20, 60000),
(4, 'Simran', 30, 70000),
(5, 'Meena', 30, 55000);


SELECT D.DeptName, COUNT(E.EmpId) AS EmployeeCount, AVG(E.Salary)::NUMERIC(10,2) AS AvgSalary,
CASE WHEN AVG(E.Salary) IS NULL THEN 'No Employees'
WHEN AVG(E.Salary)>=60000 THEN 'High Average'
WHEN AVG(E.Salary) BETWEEN 50000 AND 59999 THEN 'Medium Average'
ELSE 'Low Average' END
AS SalaryCategory
FROM Departments AS D
LEFT JOIN
Employees AS E
ON 
D.DeptId = E.DeptId
GROUP BY DeptName


--Question 2




CREATE TABLE Triangle (
	x INT,
	y INT,
	z INT,
	PRIMARY KEY (x, y, z)
);

INSERT INTO Triangle (x, y, z) VALUES
(13, 15, 30),
(10, 20, 15);

SELECT * FROM(
SELECT x, y, z, 
CASE WHEN x+y > z AND y+z > x AND x+z > y THEN 'Yes'
ELSE 'No' END
AS Triangle_formed
FROM Triangle
)AS Temp
WHERE Triangle_formed = 'Yes'
