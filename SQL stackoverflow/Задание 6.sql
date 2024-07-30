WITH grouped_data AS (SELECT u.id, COUNT(b.id) AS badges_count
FROM stackoverflow.users u
JOIN stackoverflow.badges b ON u.id = b.user_id
WHERE b.creation_date::date BETWEEN '2008-11-15' AND '2008-12-15'
GROUP BY u.id)

SELECT *, DENSE_RANK() OVER(ORDER BY badges_count DESC) AS badges_rank
FROM grouped_data
ORDER BY badges_count DESC, id ASC
LIMIT 10