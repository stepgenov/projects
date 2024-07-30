SELECT DISTINCT person_id,
COUNT(instituition)
FROM education
WHERE person_id IN
(SELECT DISTINCT id
FROM people
WHERE company_id IN (SELECT id
FROM company
WHERE id IN (SELECT company_id
FROM funding_round
WHERE is_first_round = 1 AND is_first_round = is_last_round) AND status = 'closed'))
GROUP BY DISTINCT person_id