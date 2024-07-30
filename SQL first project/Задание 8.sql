SELECT *,
CASE WHEN invested_companies >= 100 THEN 'high_activity'
WHEN invested_companies >= 20 AND invested_companies < 100 THEN 'middle_activity'
ELSE 'low_activity'
END AS activity_category
FROM fund
ORDER BY activity_category DESC;

