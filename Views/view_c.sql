CREATE VIEW films_list AS
SELECT film.film_id, title, description, category.name AS category_name,rental_rate, length, rating ,actor.first_name || '  ' || actor.last_name AS actor_name
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
INNER JOIN actor ON film_actor.actor_id = actor.actor_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
ORDER BY film_id;

SELECT * FROM films_list;