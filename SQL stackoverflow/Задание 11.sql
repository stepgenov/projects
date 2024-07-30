WITH rating AS (SELECT
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
    user_group, user_id),
max_views AS (SELECT
        user_group,
        MAX(profile_views) AS max_profile_views
    FROM
        rating
    GROUP BY
        user_group)
        
SELECT r.user_id, mv.user_group, mv.max_profile_views
FROM rating r
JOIN max_views mv ON r.user_group = mv.user_group AND r.profile_views = mv.max_profile_views
ORDER BY
    r.profile_views DESC,
    r.user_id ASC;