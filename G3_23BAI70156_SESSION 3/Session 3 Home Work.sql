--Question 1(Leetcode 1934)
-- Write your PostgreSQL query statement below
SELECT S.user_id, ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END),2) AS confirmation_rate
FROM signups AS S 
LEFT JOIN
confirmations AS C
ON
S.user_id = C.user_id
GROUP BY S.user_id


--Question 2(Leetcode 1581)
-- Write your PostgreSQL query statement below
SELECT V.customer_id, COUNT(V.customer_id) AS count_no_trans
FROM visits AS V
WHERE V.visit_id != ALL(
    SELECT DISTINCT T.visit_id
    FROM transactions AS T
)
GROUP BY V.customer_id