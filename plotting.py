import sqlite3
import matplotlib.pyplot as plt

conn = sqlite3.connect("vivino.db")

c = conn.cursor()

c.execute(
    "SELECT DISTINCT countries.name as country, ROUND(AVG(wines.ratings_average),2) AS average_rating FROM countries JOIN regions ON countries.code = regions.country_code JOIN wines ON wines.region_id = regions.id GROUP BY countries.name ORDER BY average_rating DESC"
)

countries = []
average = []
for row in c.fetchall():
    countries.append(row[0])
    # print(row[0])
    average.append(row[1])


x = countries
y = average

plt.bar(x, y)
plt.ylim(4, 4.7)
plt.grid(axis='y')
plt.show()

conn.commit()

conn.close()
