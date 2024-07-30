WITH vote_rank AS (SELECT *, ROW_NUMBER() OVER(ORDER BY id DESC)
FROM stackoverflow.vote_types)

SELECT *
FROM vote_rank
ORDER BY id
