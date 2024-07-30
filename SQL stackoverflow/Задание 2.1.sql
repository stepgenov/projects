SELECT DATE_TRUNC('month', creation_date)::date AS post_months, SUM(views_count) AS view_count
FROM stackoverflow.posts
GROUP BY DATE_TRUNC('month', creation_date)::date
ORDER BY view_count DESC
