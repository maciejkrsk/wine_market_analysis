SELECT wineries.id, wineries.name, wines.ratings_average, SUM(wines.ratings_count)
FROM wineries
JOIN wines
ON wines.winery_id = wineries.id
GROUP BY wineries.name
ORDER BY wines.ratings_count DESC