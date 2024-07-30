WITH grouped_data AS (SELECT DATE_TRUNC('day',p.creation_date)::date AS question_date, COUNT(DISTINCT p.id) AS questions_count
FROM stackoverflow.posts p
JOIN stackoverflow.post_types pt ON p.post_type_id = pt.id
WHERE DATE_TRUNC('day',p.creation_date)::date BETWEEN '2008-11-1' AND '2008-11-18'
AND pt.type = 'Question'
GROUP BY DATE_TRUNC('day',p.creation_date)::date)

SELECT ROUND(AVG(questions_count))
FROM grouped_data