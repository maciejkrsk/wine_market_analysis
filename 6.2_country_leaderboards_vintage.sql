--Country leaderboards but with vintages

SELECT DISTINCT countries.name as country, ROUND(AVG(vintages.ratings_average),2) AS average_ratings_vintage
from countries
JOIN regions
ON countries.code = regions.country_code
JOIN wines
ON wines.region_id = regions.id
-- adding vintages
JOIN vintages
ON vintages.wine_id = wines.id
GROUP BY countries.name
ORDER BY average_ratings_vintage DESC