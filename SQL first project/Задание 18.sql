SELECT AVG(num_institutions) AS avg_num_institutions
FROM (
    SELECT p.id AS person_id,
           COUNT(e.instituition) AS num_institutions
    FROM people AS p
    JOIN education AS e ON p.id = e.person_id
    WHERE p.company_id IN (
        SELECT id
        FROM company
        WHERE name = 'Socialnet'
    )
    GROUP BY p.id
) AS subquery;