WITH users AS (SELECT u.id
FROM stackoverflow.posts AS p
JOIN stackoverflow.users AS u 
ON p.user_id=u.id
WHERE (u.creation_date::date BETWEEN '2008-09-01' AND '2008-09-30')
AND (p.creation_date::date BETWEEN '2008-12-01' AND '2008-12-31')
GROUP BY u.id)



SELECT DATE_TRUNC('month', creation_date)::date AS post_months, COUNT(id) AS post_count
FROM stackoverflow.posts
WHERE user_id IN (SELECT * FROM users)
GROUP BY DATE_TRUNC('month', creation_date)::date 
ORDER BY post_months DESC
