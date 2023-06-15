--Highlight 10 wines to increase sales

SELECT name, ratings_average AS rating, ratings_count
FROM wines

--Order first by rating count as it is more reliable because
--some wines have high average but low rating count.
ORDER BY rating DESC, ratings_count DESC
LIMIT 10