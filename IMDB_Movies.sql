use project_movie_database;
show tables;
DESCRIBE movies;
DESCRIBE directors;

SELECT COUNT(*) AS total_directors FROM directors;
SELECT COUNT(*) AS total_movies FROM movies;

SELECT m.title, d.name AS director_name
FROM movies m
JOIN directors d
ON m.director_id = d.id
LIMIT 10;

# (A)Can you get all data about movies?
select * from movies;

# (B)How do you get all data about directors?
select * from directors;

# (C)Check how many movies are present in IMDB?
SELECT COUNT(*) AS total_movies FROM movies;

# (D)Find these 3 directors: James Cameron ; Luc Besson ; John Woo?
select * from directors 
where name in('James Cameron','Luc Besson','John Woo');

# (E)Find all directors with name starting with S?
select * from directors where name like 's%';

# (F)Count female directors?
select count(*) from directors 
where gender='Female';

# (G)Find the name of the 10th first women directors?
select name from directors 
where gender='Female' 
order by name limit 10;

# (H)What are the 3 most popular movies?
select title,popularity from movies 
order by popularity 
desc limit 3;

# (I)What are the 3 most bankable movies?
select title,budget from movies 
order by budget 
desc limit 3;

# (J)What is the most awarded average vote since the January 1st, 2000?
select title,vote_average from movies 
where release_date>='2000-01-01'
order by vote_average 
desc limit 1;

# (K)Which movie(s) were directed by Brenda Chapman?
SELECT m.title, d.name AS director_name
FROM movies m
JOIN directors d ON m.director_id = d.id
WHERE d.name = 'Brenda Chapman';

# (L)Which director made the most movies?
SELECT d.name AS director_name, COUNT(m.id) AS total_movies
FROM movies m
JOIN directors d ON m.director_id = d.id
GROUP BY d.name
ORDER BY total_movies DESC
LIMIT 1;

# (M)Which director is the most bankable?
SELECT d.name AS director_name, SUM(m.revenue) AS total_revenue
FROM movies m
JOIN directors d ON m.director_id = d.id
GROUP BY d.name
ORDER BY total_revenue DESC
LIMIT 1;


