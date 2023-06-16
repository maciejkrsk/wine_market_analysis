import sqlite3
import matplotlib.pyplot as plt
import numpy as np

conn = sqlite3.connect("vivino_v2.db")

c = conn.cursor()

c.execute(
    "SELECT DISTINCT countries.name as country, ROUND(AVG(vintages.ratings_average),2) AS average_ratings_vintage from countries JOIN regions ON countries.code = regions.country_code JOIN wines ON wines.region_id = regions.id JOIN vintages ON vintages.wine_id = wines.id GROUP BY countries.name ORDER BY average_ratings_vintage DESC"
)
#SELECT DISTINCT countries.name as country, ROUND(AVG(wines.ratings_average),2) AS average_rating from countries JOIN regions ON countries.code = regions.country_code JOIN wines ON wines.region_id = regions.id GROUP BY countries.name ORDER BY average_rating DESC
#SELECT DISTINCT countries.name as country, ROUND(AVG(vintages.ratings_average),2) AS average_ratings_vintage from countries JOIN regions ON countries.code = regions.country_code JOIN wines ON wines.region_id = regions.id JOIN vintages ON vintages.wine_id = wines.id GROUP BY countries.name ORDER BY average_ratings_vintage DESC
countries = []
average = []
for row in c.fetchall():
    if row[1] == 0:
        continue
    countries.append(row[0])
    
    average.append(row[1])


x = countries
y = average

plt.bar(x, y)
plt.xticks(rotation=45)
#y_ticks = np.arange(0, 4.6, 0.1)
plt.ylim(4, 4.6)
plt.grid(axis='y')
plt.suptitle('Countries leaderboards : Average vintages rating ')
plt.legend(['Average rating'])
plt.xlabel('Countries (FR)')
plt.ylabel('Average rating')
plt.show()

conn.commit()

conn.close()
