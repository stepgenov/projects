SELECT title, user_id, score,
       ROUND(AVG(score) OVER (PARTITION BY user_id))::int
FROM stackoverflow.posts     
WHERE title IS NOT NULL
      AND score != 0