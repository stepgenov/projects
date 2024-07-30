SELECT country_code,
       MIN(invested_companies) AS min_companies,
       MAX(invested_companies) AS max_companies,
       AVG(invested_companies) AS avg_companies
FROM fund
WHERE EXTRACT(YEAR FROM founded_at) BETWEEN 2010 AND 2012
GROUP BY country_code
HAVING MIN(invested_companies) > 0
ORDER BY avg_companies DESC, country_code
LIMIT 10;