--Find top 3 most common grape worldwide

SELECT grapes.name AS grape_name, grapes.id AS grape_id, SUM(most_used_grapes_per_country.wines_count) AS total_worldwide
FROM most_used_grapes_per_country
JOIN grapes
ON grapes.id = most_used_grapes_per_country.grape_id
GROUP BY most_used_grapes_per_country.wines_count
ORDER BY most_used_grapes_per_country.wines_count DESC
LIMIT 3