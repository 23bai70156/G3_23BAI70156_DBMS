--Question 1(Leetcode 1341)
(SELECT U.name AS results
FROM MovieRating AS M
INNER JOIN
Users AS U
ON
M.user_id = U.user_id
GROUP BY M.user_id, U.name
ORDER BY COUNT(M.movie_id) DESC, U.name
LIMIT 1
)
UNION ALL
(SELECT M2.title AS results
FROM MovieRating AS M1
INNER JOIN
Movies AS M2
ON 
M1.movie_id = M2.movie_id
WHERE M1.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY M2.movie_id, M2.title
ORDER BY AVG(M1.rating) DESC, M2.title
LIMIT 1
)
