--Prize for the best winery

SELECT wineries.id, wineries.name, wines.ratings_average, SUM(wines.ratings_count)
FROM wineries
JOIN wines
ON wines.winery_id = wineries.id
GROUP BY wineries.name

--One winery can sell many wines, so we make a sum of ratings count
--assuming you actually have to buy the product to submit a rating,
--it can be interpreted as wines_sold
ORDER BY wines.ratings_count DESC