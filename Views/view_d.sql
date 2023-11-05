CREATE VIEW actor_list AS
SELECT actor.actor_id, actor.first_name, actor.last_name,film.title || ' : ' || film.description || ' : ' || category.name AS films_made
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY actor.actor_id, actor.first_name, actor.last_name, films_made
ORDER BY actor.actor_id;

SELECT * FROM actor_list;