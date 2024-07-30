SELECT fd.name AS name_of_fund,
       co.name AS name_of_company,
       fr.raised_amount AS amount
FROM investment AS inv
JOIN company AS co ON inv.company_id = co.id
JOIN fund AS fd ON inv.fund_id = fd.id
JOIN funding_round AS fr ON inv.funding_round_id = fr.id
WHERE co.milestones > 6 AND EXTRACT(YEAR FROM fr.funded_at) BETWEEN 2012 AND 2013
GROUP BY fd.name, co.name,  fr.raised_amount;