--Question 1
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    product_category VARCHAR(50)
);

INSERT INTO Products (product_id, product_name, product_category) VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');

CREATE TABLE Orders (
    product_id INT,
    order_date DATE,
    unit INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Orders (product_id, order_date, unit) VALUES
(1, '2020-02-05', 60),
(1, '2020-02-10', 70),
(2, '2020-01-18', 30),
(2, '2020-02-11', 80),
(3, '2020-02-17', 2),
(3, '2020-02-24', 3),
(4, '2020-03-01', 20),
(4, '2020-03-04', 30),
(4, '2020-03-04', 60),
(5, '2020-02-25', 50),
(5, '2020-02-27', 50),
(5, '2020-03-01', 50);

SELECT P.product_name, SUM(O.unit) 
FROM Products AS P
LEFT JOIN 
Orders AS O
ON
P.product_id = O.product_id
WHERE 
O.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY P.product_name
HAVING SUM(O.unit)>=100



--QUESTION 2



CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE Enrollments (
    student_id INT,
    course VARCHAR(50)
);

INSERT INTO Student (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

INSERT INTO Enrollments (student_id, course) VALUES
(1, 'DBMS'),
(3, 'Java'),
(5, 'Python');

--using NOT IN
SELECT * 
FROM Student AS S
WHERE S.student_id NOT IN (SELECT student_id FROM Enrollments)

--using joins
SELECT S.student_id, S.student_name
FROM Student AS S
LEFT JOIN
Enrollments AS E
ON
S.student_id = E.student_id
WHERE E.student_id IS NULL