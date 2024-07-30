WITH first_posts AS (
    SELECT
        user_id,
        MIN(creation_date) AS first_post_date
    FROM
        stackoverflow.posts
    GROUP BY
        user_id
)
SELECT
    u.id AS user_id,
    fp.first_post_date - u.creation_date AS time_interval
FROM
    stackoverflow.users u
JOIN
    first_posts fp ON u.id = fp.user_id
WHERE
    fp.first_post_date IS NOT NULL;
