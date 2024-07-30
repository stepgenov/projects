WITH user_record AS (SELECT user_id, COUNT(id) AS posts_count
FROM stackoverflow.posts
GROUP BY user_id
ORDER BY posts_count DESC
LIMIT 1)
SELECT EXTRACT(WEEK FROM p.creation_date) AS week, MAX(p.creation_date) 
FROM stackoverflow.posts p
JOIN user_record u ON p.user_id = u.user_id
WHERE DATE_TRUNC('month', creation_date) = '2008-10-01'
GROUP BY EXTRACT(WEEK FROM creation_date)