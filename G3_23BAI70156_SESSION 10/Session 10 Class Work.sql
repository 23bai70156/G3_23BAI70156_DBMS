--Question 1

DROP TABLE products;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(50)
);

INSERT INTO products (product_id, product, category) VALUES
(1, 'LAPTOP', 'ELECTRONICS'),
(2, 'SMARTPHONE', 'ELECTRONICS'),
(3, 'TABLETS', 'ELECTRONICS'),
(9, 'PRINTER', 'ELECTRONICS'),
(4, 'HEADPHONES', 'ACCESSORIES'),
(5, 'SMARTWATCH', 'ACCESSORIES'),
(6, 'KEYBOARD', 'ACCESSORIES'),
(7, 'MOUSE', 'ACCESSORIES'),
(8, 'MONITOR', 'ACCESSORIES');



SELECT ROW_NUMBER() OVER(PARTITION BY category ORDER BY product_id DESC) AS product_id,
product, category
FROM products

WITH CTE1 AS(
SELECT ROW_NUMBER() OVER(PARTITION BY category ORDER BY product_id DESC) AS R, 
COUNT(*) OVER(PARTITION BY category) AS CNT, product, category
FROM products
)
SELECT CNT-R+1 AS product_id, product, category
FROM CTE1
ORDER BY category DESC, product_id


--Question 2


CREATE TABLE customers (
    id INT PRIMARY KEY,
    email VARCHAR(100)
);

INSERT INTO customers (id, email) VALUES
(1, 'john@example.com'),
(2, 'bob@example.com'),
(3, 'john@example.com');

WITH CTE2 AS(
SELECT *, ROW_NUMBER() OVER(PARTITION BY email) AS R
FROM customers
)
SELECT id, email
FROM CTE2
WHERE r = 1
ORDER BY id


--Question 3


CREATE TABLE table_a (
    empid INT,
    ename VARCHAR(50),
    salary INT
);

CREATE TABLE table_b (
    empid INT,
    ename VARCHAR(50),
    salary INT
);

INSERT INTO table_a (empid, ename, salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

INSERT INTO table_b (empid, ename, salary) VALUES
(2, 'BB', 400),
(3, 'CC', 100);

WITH CTE3 AS(
SELECT *
FROM table_a
UNION ALL
SELECT *
FROM table_b
), CTE4 AS(
SELECT *, ROW_NUMBER() OVER(PARTITION BY ename ORDER BY SALARY) AS R
FROM CTE3
)
SELECT empid, ename, salary
FROM CTE4 
WHERE R = 1


--Question 4


CREATE TABLE sales_ytd (
    month_name VARCHAR(10),
    ytd_sales INT
);
INSERT INTO sales_ytd (month_name, ytd_sales) VALUES
('Jan', 15),
('Feb', 22),
('Mar', 35),
('Apr', 45),
('May', 60);

SELECT month_name, ytd_sales-LAG(ytd_sales, 1, 0) OVER() AS periodic_sale
FROM sales_ytd

