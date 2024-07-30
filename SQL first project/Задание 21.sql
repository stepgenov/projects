SELECT 
    c.name AS "Название компании",
     EXTRACT(MONTH FROM fr.funded_at) AS "Номер месяца"
FROM 
    company c
JOIN 
    funding_round fr ON c.id = fr.company_id
WHERE 
    c.category_code = 'social'
    AND fr.funded_at BETWEEN '2010-01-01' AND '2013-12-31'
    AND fr.raised_amount > 0
ORDER BY "Номер месяца"