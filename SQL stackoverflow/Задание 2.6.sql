WITH grouped_data AS (
SELECT EXTRACT(MONTH FROM creation_date) AS month_number, COUNT(id) AS post_count
FROM stackoverflow.posts
WHERE creation_date::date BETWEEN '2008-09-01' AND '2008-12-31'
GROUP BY EXTRACT(MONTH FROM creation_date)
ORDER BY month_number)

SELECT month_number, post_count, ROUND((post_count::numeric/LAG(post_count) OVER()-1)*100, 2)
FROM grouped_data
