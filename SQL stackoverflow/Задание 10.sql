SELECT
    id AS user_id,
    views AS profile_views,
    CASE
        WHEN views >= 350 THEN 1
        WHEN views >= 100 THEN 2
        ELSE 3
    END AS user_group
FROM
    stackoverflow.users
WHERE
    location LIKE '%Canada%'
    AND views > 0
ORDER BY
    user_group, user_id;
    