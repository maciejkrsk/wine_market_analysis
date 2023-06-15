--Country leaderboard

SELECT DISTINCT countries.name as country, ROUND(AVG(wines.ratings_average),2) AS average_rating
from countries
JOIN regions
ON countries.code = regions.country_code
JOIN wines
ON wines.region_id = regions.id
GROUP BY countries.name
ORDER BY average_rating DESC