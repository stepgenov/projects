SELECT c.name AS company_name,
       COUNT(DISTINCT e.instituition) AS num_universities
FROM company AS c
JOIN people AS p ON c.id = p.company_id
JOIN education AS e ON p.id = e.person_id
GROUP BY c.name
ORDER BY num_universities DESC, c.name
LIMIT 5;