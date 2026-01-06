-- SELECT (with WHERE, ORDER BY, and GROUP BY), JOIN, aggregation functions, subqueries/CTEs
-- 1: SELECT, ORDER BY, JOIN
SELECT e.Movie_id, Title, Worldwide, Domestic 
FROM earning e
LEFT JOIN IMDB i ON e.Movie_id = i.Movie_id
ORDER BY Worldwide DESC, Domestic DESC;
-- 2: GROUP BY, aggregations
SELECT genre, COUNT(Movie_id) AS total_in_genre
FROM genre
GROUP BY genre
ORDER BY total_in_genre DESC;
-- 3: WHERE
SELECT *
FROM IMDB
WHERE Votes3044 > 8.0;
-- 4: subqueries/CTEs
SELECT *
FROM IMDB
WHERE Rating > (SELECT MIN(Votes3044M) FROM IMDB)
ORDER BY TotalVotes DESC;
-- 5
SELECT *
FROM IMDB
WHERE Budget > (SELECT AVG(Budget) FROM IMDB)
	AND Runtime NOT LIKE ""
ORDER BY Rating DESC;
-- 6
SELECT genre.Movie_id, Title, genre
FROM genre
LEFT JOIN IMDB ON genre.Movie_id = IMDB.Movie_id 
WHERE genre LIKE "";