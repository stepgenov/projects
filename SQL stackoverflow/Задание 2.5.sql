WITH active_users AS (SELECT user_id, COUNT(DISTINCT DATE_TRUNC('day', creation_date)::date) AS active_days
FROM stackoverflow.posts
WHERE DATE_TRUNC('day', creation_date)::date BETWEEN '2008-12-01' AND '2008-12-07'
GROUP BY user_id)
SELECT ROUND(AVG(active_days))
FROM active_users