WITH users_count AS (SELECT
        EXTRACT(DAY FROM creation_date) AS day,
        COUNT(*) AS new_users
    FROM
        stackoverflow.users
    WHERE
        EXTRACT(MONTH FROM creation_date) = 11
        AND EXTRACT(YEAR FROM creation_date) = 2008
    GROUP BY
        EXTRACT(DAY FROM creation_date))
        
SELECT day, new_users, SUM(new_users) OVER(ORDER BY day)
FROM users_count
