WITH
     inv_2011 AS (SELECT co.country_code, 
                    AVG(co.funding_total) 
             FROM company AS co
             WHERE EXTRACT(YEAR FROM co.founded_at) = 2011
             GROUP BY co.country_code 
             HAVING COUNT(co.id) > 0),  -- сформируйте первую временную таблицу
     inv_2012 AS (SELECT co.country_code, 
                    AVG(co.funding_total) 
             FROM company AS co
             WHERE EXTRACT(YEAR FROM co.founded_at) = 2012
             GROUP BY co.country_code 
             HAVING COUNT(co.id) > 0),
     inv_2013 AS (SELECT co.country_code, 
                    AVG(co.funding_total) 
             FROM company AS co
             WHERE EXTRACT(YEAR FROM co.founded_at) = 2013
             GROUP BY co.country_code 
             HAVING COUNT(co.id) > 0)
SELECT inv_2011.country_code,
       inv_2011.avg,
       inv_2012.avg,
       inv_2013.avg
FROM inv_2011
INNER JOIN inv_2012  ON inv_2011.country_code = inv_2012.country_code
INNER JOIN inv_2013 ON inv_2012.country_code = inv_2013.country_code
ORDER BY inv_2011.avg DESC