WITH invest AS (SELECT EXTRACT(MONTH FROM fr.funded_at) AS funded_month, 
                  COUNT(DISTINCT f.id) AS count_fund
           FROM   investment AS i 
           JOIN   funding_round AS fr ON fr.id = i.funding_round_id
           JOIN   fund AS f ON f.id = i.fund_id
           WHERE  f.country_code = 'USA'
           AND    fr.funded_at BETWEEN '2010-01-01' AND '2013-12-31'
           GROUP BY funded_month), 

acquired AS (SELECT EXTRACT(MONTH FROM acquired_at) AS acquired_month, 
                    COUNT(acquired_company_id) AS count_company, 
                    SUM(price_amount) AS sum_price_amount 
             FROM   acquisition
             WHERE  acquired_at BETWEEN '2010-01-01' AND '2013-12-31'
             GROUP BY acquired_month) 

SELECT invest.funded_month, 
       invest.count_fund, 
       acquired.count_company,
       acquired.sum_price_amount
FROM   invest
JOIN   acquired ON acquired.acquired_month = invest.funded_month;