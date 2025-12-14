--Question 1(Leetcode 1174)
-- Write your PostgreSQL query statement below
SELECT ROUND(AVG(CASE WHEN order_date = customer_pref_delivery_date THEN 1.0 ELSE 0.0 END)*100,2) AS immediate_percentage
FROM Delivery AS D
WHERE order_date = (
    SELECT MIN(order_date)
    FROM Delivery
    WHERE customer_id = D.customer_id
);
