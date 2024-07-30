SELECT inv.activity,
       ROUND(AVG(inv.investment_rounds))
FROM (SELECT *,
       CASE
           WHEN invested_companies>=100 THEN 'high_activity'
           WHEN invested_companies>=20 THEN 'middle_activity'
           ELSE 'low_activity'
       END AS activity
FROM fund) AS inv
GROUP BY inv.activity
ORDER BY AVG(inv.investment_rounds) ASC;
