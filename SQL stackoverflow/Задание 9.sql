WITH millenial AS (SELECT u.id, COUNT(b.id) AS badges_count
FROM stackoverflow.users u 
JOIN stackoverflow.badges b ON u.id = b.user_id
GROUP BY u.id
HAVING COUNT(b.id) > 1000)

SELECT title
FROM stackoverflow.posts p
JOIN millenial m ON p.user_id = m.id
WHERE title IS NOT NULL