![Ironhack logo](https://i.imgur.com/1QgrNNw.png)

# Lab | My First Queries

Open the PgAdmin server from PostgreSQL - pgAdmin 4 is a server that runs on a browser, which is pretty good for an easy start. If you haven't already,
start a new server by passing the password you've setup. Create a database called **applestore** and use the `dump file` provided to import a database. 

After creating the `applestore` database, right click it and `restore` it. Select the dump file and hopefully pgAdmin will create the database needed for 
the following exercises.

Use the table to query the data about Apple Store Apps and answer the following questions: 

**1. What are the different genres?**

SELECT DISTINCT prime_genre FROM data;

**2. Which is the genre with the most apps rated?**
The count of ratings an app has received is in the rating_count_tot column.

SELECT prime_genre,
		COUNT(rating_count_tot) AS "Total Apps rated per Genre"
	FROM data	
	GROUP BY prime_genre 
	ORDER BY "Total Apps rated per Genre" DESC
	LIMIT 1;

**3. Which is the genre with most apps?**

SELECT prime_genre,
		COUNT(id) AS "Total Apps per Genre"
	FROM data
	GROUP BY prime_genre
	ORDER BY "Total Apps per Genre" DESC
	LIMIT 1;

**4. Which is the one with least?**

SELECT prime_genre,
		COUNT(id) AS "Total Apps per Genre"
	FROM data
	GROUP BY prime_genre
	ORDER BY "Total Apps per Genre"
	LIMIT 1;

**5. Find the top 10 apps most rated.**

SELECT track_name,
		rating_count_tot
	FROM data
	ORDER BY rating_count_tot DESC
	LIMIT 10;

**6. Find the top 10 apps best rated by users.**

SELECT track_name,
		user_rating,
		rating_count_tot
	FROM data
	ORDER BY user_rating DESC, rating_count_tot DESC
	LIMIT 10;

**7. Take a look at the data you retrieved in question 5. Give some insights.**

The genre that dominates the top 10 with 4 apps is game, the second is social networking 
if we consider that Instagram is also is this category, with 3.

**8. Take a look at the data you retrieved in question 6. Give some insights.**

All the apps are in the game genre besides Domino's pizza.

**9. Now compare the data from questions 5 and 6. What do you see?**

They are totally different.

**10. How could you take the top 3 regarding both user ratings and number of votes?**

**11. Do people care about the price of an app?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

SELECT price,
		AVG(rating_count_tot) as "Avg rating count by price"
	FROM data
	GROUP BY price
	ORDER BY "Avg rating count by price" DESC;

Grouping the rows by the price and ordering(descendingly) by the average count of rating give us a ranking, we can observe that the free apps are the ones 
with the highest count of rating in average and the second group are the apps priced at 0.99. After that it's not linear. So it seems like people prefer 
apps that are free or 0.99 but above these price groups it depends on other variables besides price.

**Bonus: Find the total number of games available in more than 1 language.**

SELECT COUNT(track_name) as "Total Games(more than 1 language)"
	FROM data
	WHERE prime_genre = 'Games' AND "lang.num" > 1
	GROUP BY prime_genre;

**Bonus2: Find the number of free vs paid apps**

SELECT SUM(CASE WHEN price = 0 then 1 ELSE 0 END) as "Total free apps",
		SUM(CASE WHEN price > 0 then 1 ELSE 0 END) as "Total paid apps"
	FROM data

**Bonus3: Find the number of free vs paid apps for each genre**

SELECT prime_genre,
		SUM(CASE WHEN price = 0 then 1 ELSE 0 END) as "Total free apps",
		SUM(CASE WHEN price = 0 then 0 ELSE 1 END) as "Total paid apps"
	FROM data
	GROUP BY prime_genre

## Deliverables 
You need to submit a `.sql` file that includes the queries used to answer the questions above, as well as an `.md` file including your answers. 
