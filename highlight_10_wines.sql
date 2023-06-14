SELECT
    name,
    ratings_average AS rating, ratings_count
FROM
    wines
ORDER BY
    rating DESC, ratings_count DESC
LIMIT 10