-- INFORMATION OF THE DIFFERENT ACTORS.
-- Neccesar tables: actor, film_actor, film, film_category, category
SELECT actor.actor_id, actor.first_name, actor.last_name,film.title AS film_title, film.description AS film_description, category.name AS category_name
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
INNER JOIN film ON film_actor.film_id = film.film_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
ORDER BY actor.actor_id;