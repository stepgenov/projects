SELECT COUNT(*)
FROM stackoverflow.posts p
JOIN stackoverflow.post_types pt ON p.post_type_id = pt.id 
WHERE pt.type = 'Question' AND (p.score > 300 OR p.favorites_count >= 100)