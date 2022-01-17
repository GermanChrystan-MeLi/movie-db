-- Mostrar el título y el nombre del género de todas las series.
SELECT series.title, genres.name FROM movies_db.series INNER JOIN movies_db.genres ON series.genre_id = genres.id;

-- Mostrar el título de los episodios, el nombre y apellido de los actores que trabajan en cada uno de ellos.
SELECT episodes.title, actors.first_name, actors.last_name FROM movies_db.episodes 
INNER JOIN movies_db.actor_episode ON episodes.id = actor_episode.episode_id 
INNER JOIN movies_db.actors ON actors.id = actor_episode.actor_id

-- Mostrar el título de todas las series y el total de temporadas que tiene cada una de ellas.
SELECT series.title, count(*) as seasons FROM movies_db.series 
INNER JOIN movies_db.seasons ON seasons.serie_id = series.id 
GROUP BY series.title

-- Mostrar el nombre de todos los géneros y la cantidad total de películas por cada uno, siempre que sea mayor o igual a 3.
SELECT genres.name, count(*) as movies FROM movies_db.genres 
INNER JOIN movies_db.movies ON genres.id = movies.genre_id 
GROUP BY genres.name
HAVING movies > 3

-- Mostrar sólo el nombre y apellido de los actores que trabajan en todas las películas de la guerra de las galaxias y que estos no se repitan.
SELECT DISTINCT actors.first_name, actors.last_name FROM movies_db.actors
INNER JOIN movies_db.actor_movie ON actors.id = actor_movie.actor_id
INNER JOIN movies_db.movies ON movies.id = actor_movie.movie_id
WHERE movies.title LIKE "La Guerra de las galaxias%"