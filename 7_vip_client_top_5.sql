--Find top 5 recommendations for a Cabernet Sauvignon enjoyer
--Proceeded with the grape named Cabernet Sauvignon and wines containing this grape

SELECT wines.id AS wine_id, wines.name
FROM wines
JOIN keywords_wine
ON keywords_wine.wine_id = wines.id
JOIN keywords
ON keywords_wine.keyword_id = keywords.id
WHERE keywords_wine.keyword_id = 2
LIMIT 5