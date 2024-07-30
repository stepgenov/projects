SELECT AVG(num_institutions) AS avg_num_institutions
FROM (
    SELECT p.id AS person_id,
           COUNT(e.instituition) AS num_institutions
    FROM people AS p
    JOIN education AS e ON p.id = e.person_id
    WHERE p.company_id IN (
        SELECT id
        FROM company
        WHERE id IN (
            SELECT company_id
            FROM funding_round
            WHERE is_first_round = 1 AND is_first_round = is_last_round
        ) AND status = 'closed'
    )
    GROUP BY p.id
) AS subquery;