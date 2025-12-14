--G3_23BAI70156_SESSION 2

--Question 1(Leetcode 1661)
SELECT machine_id,
ROUND(SUM((CASE WHEN activity_type = 'end' THEN timestamp ELSE -timestamp end)::NUMERIC(10,3))/(COUNT(DISTINCT process_id)),3) AS processing_time
FROM Activity
GROUP BY machine_id


--Question 2(Leetcode 196)
DELETE P2
FROM Person AS P1
INNER JOIN Person AS P2
ON P1.email = P2.email
WHERE P1.id < P2.id;