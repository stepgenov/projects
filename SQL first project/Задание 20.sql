SELECT
acq.name AS "Название компании-покупателя",
a.price_amount AS "Сумма сделки",
comp.name AS "Название компании, которую купили",
comp.funding_total AS "Сумма инвестиций, вложенных в купленную компанию",
ROUND(a.price_amount / comp.funding_total) AS "Доля"
FROM acquisition AS a
JOIN company AS acq ON a.acquiring_company_id = acq.id
JOIN company AS comp ON a.acquired_company_id = comp.id
WHERE a.price_amount > 0 AND comp.funding_total > 0
ORDER BY a.price_amount DESC, comp.name
LIMIT 10;