# Rent DvD Data Base

## Descripción y tareas

1. Restauración de la base de datos contenida en el archivo `alquilerdvd.tar` haciendo uso del comando `pg_restore` .

2. Tras la restauración existen una serie de tablas como las de actor, dirección, categoría, ciudad, país, cliente, película, actor de la película, categoría de la película, inventario, lenguaje, pago, alquiler, trabajadores (staff), almacen (store).

3. Posiblemente las principales tablas de la base de datos corresponden con las tablas: cliente, película, alquiler, inventario, pago, trabajadores (staff).

4. Realización de las distintas consultas solicitadas:

4.1. Ventas totales por categoría de películas ordenadas de manera descendente.
```sql
SELECT COUNT(*) AS total_rent, category.name AS category_name
FROM rental
INNER JOIN inventory ON rental.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
GROUP BY category_name
ORDER BY total_rent DESC;
```

4.2 Ventas totales por tienda, donde se pueda observar la ciudad, el pais (concatenar la ciudad y el pais haciendo uso del separador ,) y el encargado. 
```sql
SELECT COUNT(*) AS total_rent , store.store_id AS store_id, city.city AS city, country.country AS country, staff.first_name AS manager_staff_first_name, staff.last_name AS manager_staff_last_name
FROM rental
INNER JOIN inventory on rental.inventory_id = inventory.inventory_id
INNER JOIN store ON inventory.store_id = store.store_id
INNER JOIN staff ON store.manager_staff_id = staff.staff_id
INNER JOIN address ON store.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id
GROUP BY store.store_id, manager_staff_first_name, manager_staff_last_name, city, country
ORDER BY total_rent DESC;
```