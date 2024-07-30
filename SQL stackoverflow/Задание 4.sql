WITH user_joel AS (
    SELECT id
    FROM stackoverflow.users
    WHERE display_name = 'Joel Coehoorn'
),


user_posts AS (
    SELECT p.id AS post_id
    FROM stackoverflow.posts p
    JOIN user_joel u ON p.user_id = u.id
    JOIN stackoverflow.votes v ON p.id = v.post_id
    GROUP BY p.id
    HAVING COUNT(v.id) > 0
)


SELECT COUNT(DISTINCT post_id) AS unique_posts_with_votes
FROM user_posts;