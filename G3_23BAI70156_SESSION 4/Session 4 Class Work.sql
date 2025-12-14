--Question 1
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

INSERT INTO Students (student_id, student_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

CREATE TABLE Subjects (
    subject_name VARCHAR(50) PRIMARY KEY
);

INSERT INTO Subjects (subject_name) VALUES
('Math'),
('Physics'),
('Programming');

CREATE TABLE Examinations (
    student_id INT,
    subject_name VARCHAR(50)
);

INSERT INTO Examinations (student_id, subject_name) VALUES
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1, 'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2, 'Math'),
(1, 'Math');

SELECT ST.student_id, ST.student_name, S.subject_name, COUNT(E.student_id) AS attended_exmas
FROM Students AS ST
CROSS JOIN
Subjects AS S
LEFT JOIN
Examinations AS E
ON
E.student_id = ST.student_id
AND E.subject_name = S.subject_name
GROUP BY ST.student_id, ST.student_name, S.subject_name
ORDER BY ST.student_id



--Question 2(Leetcode 1193)
SELECT to_char(trans_date,'yyyy-mm') as month, country, 
COUNT(amount) as trans_count, 
COUNT(CASE WHEN state = 'approved' then id else null end) as approved_count,
SUM(amount) as trans_total_amount,
SUM(CASE WHEN state = 'approved' then amount else 0 end) as approved_total_amount 
FROM Transactions 
GROUP BY month,country