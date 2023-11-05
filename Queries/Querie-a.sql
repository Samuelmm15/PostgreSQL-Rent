-- TOTAL RENT PER CATEGORY OF FILMS ORDERED DESCENDING
-- Neccesary tables: rental, inventory, film, film_category, category
-- Cabe destacar que el empleo de INNER JOIN es mejor que el uso de NATURAL JOIN, queda de manera mas profesional.
SELECT COUNT(*) AS total_rent, category.name AS category_name
FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category_name
ORDER BY total_rent DESC;