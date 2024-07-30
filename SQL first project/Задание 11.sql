SELECT ppl.first_name,
       ppl.last_name,
       edu.instituition
FROM (SELECT id,
      first_name,
       last_name 
FROM people) AS ppl 
LEFT OUTER JOIN
(SELECT person_id, 
instituition
FROM education) AS edu ON ppl.id = edu.person_id;