-- ADDING SOME NEW ROWS TO THE TABLE FILM TO COMPROBE THE TRIGGER

-- DELETING THE INTRODUCED ROW TO REINTRODUCE IT LATER
DELETE FROM film WHERE title = 'The Lord of the Rings: The Fellowship of the Ring';

INSERT INTO film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features)  VALUES ('The Lord of the Rings: The Fellowship of the Ring', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', 2001, 1, 3, 4.99, 178, 19.99, 'PG-13', '{Behind the Scenes, Deleted Scenes}');