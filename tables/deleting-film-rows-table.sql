-- TABLE THAT CONTAINS THE DATE OF THE ROWS THAT WERE DELETED FROM THE TABLE FILM

DROP TABLE IF EXISTS deleting_film_rows CASCADE;

CREATE TABLE deleting_film_rows (
    delete_id SERIAL PRIMARY KEY,
    film_id INT NOT NULL,
    last_update TIMESTAMP NOT NULL
);