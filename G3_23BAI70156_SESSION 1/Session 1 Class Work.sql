--G3_23BAI70156_GAURAV MONGA_SESSION 1

--Question 1

CREATE TABLE client_master (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE service_catalog (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100),
    hourly_rate NUMERIC(10,2)
);

CREATE TABLE invoice_details (
    invoice_id INT PRIMARY KEY,
    client_id INT REFERENCES client_master(client_id),
    service_id INT REFERENCES service_catalog(service_id),
    hours_worked INT,
    discount_percent INT,
    invoice_date DATE
);

INSERT INTO client_master (client_id, client_name, email) VALUES
(1, 'Rahul Sharma', 'rahul@gmail.com'),
(2, 'Anita Verma', 'anita@gmail.com'),
(3, 'Karan Singh', 'karan@gmail.com');

INSERT INTO service_catalog (service_id, service_name, hourly_rate) VALUES
(101, 'Web Development', 1200.00),
(102, 'Data Analysis', 1500.00),
(103, 'SEO Optimization', 800.00);

INSERT INTO invoice_details (invoice_id, client_id, service_id, hours_worked, discount_percent, invoice_date) VALUES
(1001, 1, 101, 10, 10, '2025-01-05'),
(1002, 2, 102, 8,  5,  '2025-01-07'),
(1003, 3, 103, 12, 0,  '2025-01-10');

CREATE OR REPLACE VIEW vw_invoice_summary
AS
SELECT I.invoice_id, I.invoice_date, C.client_name, S.service_name, ((((S.hourly_rate * I.hours_worked) * (100 - I.discount_percent))/100)) AS final_amount
FROM invoice_details AS I
JOIN client_master AS C
ON I.client_id = C.client_id
JOIN service_catalog AS S
ON S.service_id = I.service_id

SELECT * FROM vw_invoice_summary

CREATE ROLE arjun
WITH LOGIN PASSWORD 'ABC'

GRANT SELECT ON vw_invoice_summary TO arjun
REVOKE SELECT ON vw_invoice_summary FROM arjun



--Question 2
CREATE TABLE customer(
cust_id INT PRIMARY KEY,
cust_name VARCHAR(20)
);

INSERT INTO customer VALUES(101,'GAURAV');

INSERT INTO customer VALUES(102,'AVIN');

CREATE TABLE orders(
order_id INT,
cust_id INT,
amount NUMERIC(10,2),
FOREIGN KEY (cust_id) REFERENCES customer(cust_id)
ON UPDATE CASCADE
ON DELETE CASCADE
)

INSERT INTO orders VALUES(100, 101, 99999999);

INSERT INTO orders VALUES(101, 102, 99999999);

INSERT INTO orders VALUES(102, 103, 5000);

UPDATE customer
SET cust_id = 201
WHERE cust_id = 101;

DELETE FROM customer
WHERE cust_id = 102;

SELECT * FROM customer;
SELECT * FROM orders;

DROP TABLE orders;
DROP TABLE customer;