SELECT * FROM authors
SELECT * FROM discounts
SELECT * FROM employee
SELECT * FROM jobs
SELECT * FROM publishers
SELECT * FROM roysched
SELECT * FROM sales
SELECT * FROM stores
SELECT * FROM titleauthor
SELECT * FROM titles

SELECT au.au_id,
		au.au_lname,
		au.au_fname,
		tit.title,
		pu.pub_name
	FROM titleauthor AS ta
			LEFT JOIN
			titles AS tit
		ON tit.title_id = ta.title_id
				LEFT JOIN
				authors AS au
			ON ta.au_id = au.au_id
					LEFT JOIN
					publishers as pu
				ON tit.pub_id = pu.pub_id;

Who Have Published How Many At Where?

SELECT au.au_id,
		au.au_lname,
		au.au_fname,
		COUNT(tit.title) AS "Title Count",
		pu.pub_name
	FROM titleauthor AS ta
			LEFT JOIN
			titles AS tit
		ON tit.title_id = ta.title_id
				LEFT JOIN
				authors AS au
			ON ta.au_id = au.au_id
					LEFT JOIN
					publishers as pu
				ON tit.pub_id = pu.pub_id
		GROUP BY au.au_id, pu.pub_name, au.au_lname, au.au_fname
		ORDER BY "Title Count" DESC;
		

SELECT au.au_id,
		au.au_lname,
		au.au_fname,
		SUM(s.qty) AS "Total Sold"
	FROM sales AS s
			LEFT JOIN
			titleauthor AS ta
		ON s.title_id = ta.title_id
				LEFT JOIN
				authors AS au
			ON ta.au_id = au.au_id
	GROUP BY au.au_id, au.au_lname, au.au_fname
	ORDER BY "Total Sold" DESC
	LIMIT 3;
	
SELECT au.au_id,
		au.au_lname,
		au.au_fname,
		SUM(s.qty) AS "Total Sold"
	FROM sales AS s
			LEFT JOIN
			titleauthor AS ta
		ON s.title_id = ta.title_id
				LEFT JOIN
				authors AS au
			ON ta.au_id = au.au_id
	GROUP BY au.au_id, au.au_lname, au.au_fname
	ORDER BY "Total Sold" DESC
	LIMIT 3;



SELECT au.au_id,
		au.au_lname,
		au.au_fname,
		COALESCE(SUM(s.qty), 0) AS "Total Sold"
	FROM sales AS s
			LEFT JOIN
			titleauthor AS ta
		ON s.title_id = ta.title_id
				FULL JOIN
				authors AS au
			ON ta.au_id = au.au_id
	GROUP BY au.au_id, au.au_lname, au.au_fname
	ORDER BY "Total Sold" DESC;

