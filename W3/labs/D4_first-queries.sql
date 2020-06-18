SELECT DISTINCT prime_genre FROM data;

SELECT prime_genre,
		COUNT(rating_count_tot) AS "Total Apps rated per Genre"
	FROM data	
	GROUP BY prime_genre 
	ORDER BY "Total Apps rated per Genre" DESC
	LIMIT 1;

SELECT prime_genre,
		COUNT(id) AS "Total Apps per Genre"
	FROM data
	GROUP BY prime_genre
	ORDER BY "Total Apps per Genre" DESC
	LIMIT 1;

SELECT prime_genre,
		COUNT(id) AS "Total Apps per Genre"
	FROM data
	GROUP BY prime_genre
	ORDER BY "Total Apps per Genre"
	LIMIT 1;
	
SELECT track_name,
		rating_count_tot
	FROM data
	ORDER BY rating_count_tot DESC
	LIMIT 10;
		
SELECT user_rating,
		COUNT(user_rating)
		FROM data
	WHERE user_rating = 5	
	GROUP BY user_rating
	
SELECT track_name,
		rating_count_tot,
		prime_genre
	FROM data
	ORDER BY rating_count_tot DESC
	LIMIT 10;

SELECT track_name,
		user_rating,
		rating_count_tot,
		prime_genre
	FROM data
	ORDER BY user_rating DESC, rating_count_tot DESC
	LIMIT 10;
	
SELECT price,
		AVG(rating_count_tot) as "Avg rating count by price"
	FROM data
	GROUP BY price
	ORDER BY "Avg rating count by price" DESC;
	
SELECT COUNT(track_name) as "Total Games(more than 1 language)"
	FROM data
	WHERE prime_genre = 'Games' AND "lang.num" > 1
	GROUP BY prime_genre;

SELECT prime_genre,
		SUM(CASE WHEN price = 0 then 1 ELSE 0 END) as "Total free apps",
		SUM(CASE WHEN price = 0 then 0 ELSE 1 END) as "Total paid apps"
	FROM data
	GROUP BY prime_genre

SELECT COUNT(track_name) as "Total free apps"
	FROM data
	WHERE price = 0
		UNION ALL
SELECT COUNT(track_name) as "Total paid apps"
	FROM data
	WHERE price > 0
	

	