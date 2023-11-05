-- TOTAL RENT BY STORE (ID, CITY, COUNTRY, STAFF)
-- Neccesary tables: rental, inventory, store, staff, address, city, country
SELECT COUNT(*) AS total_rent , store.store_id AS store_id, city.city || ', ' || country.country AS cityu_and_country, staff.first_name AS manager_staff_first_name, staff.last_name AS manager_staff_last_name
FROM rental
INNER JOIN inventory on rental.inventory_id = inventory.inventory_id
INNER JOIN store ON inventory.store_id = store.store_id
INNER JOIN staff ON store.manager_staff_id = staff.staff_id
INNER JOIN address ON store.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
GROUP BY store.store_id, manager_staff_first_name, manager_staff_last_name, city, country
ORDER BY total_rent DESC;

-- Cabe destacar que para poder implementar la concatenacion en psql se realiza mediante el operador ||