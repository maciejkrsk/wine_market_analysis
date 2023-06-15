--Find all wines having a specified group of keywords, flavor group 
--& having more than 10 users 

SELECT wines.name AS wine,wines.id as wine_id, keywords_wine.group_name
FROM wines
JOIN keywords_wine ON wines.id = keywords_wine.wine_id
JOIN keywords ON keywords.id = keywords_wine.keyword_id

--The actual finding part
WHERE keywords.name IN ('coffee', 'toast', 'green apple', 'cream', 'citrus')

--Filtering to 'primary' keywords type (There is 'primary' and 'secondary')
AND keywords_wine.keyword_type = 'primary'
GROUP BY wines.id, wines.name

--Assuming a wine can't have 2x the same keyword and only selecting the 5 above
HAVING COUNT(keywords.id) = 5
AND keywords_wine.count > 10