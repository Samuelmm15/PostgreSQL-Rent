-- TRIGGER THAT INSERTS THE DATE OF THE ROWS THAT WERE DELETED FROM THE TABLE FILM AND THE ID OF THE ROWS THAT WERE DELETED FROM THE TABLE FILM

-- Delete the trigger if it already exists
DROP TRIGGER IF EXISTS delete_film_trigger ON film;
-- Delete the function is it already exists
DROP FUNCTION IF EXISTS delete_table_film();

-- Create the function that will be called by the trigger
CREATE FUNCTION delete_table_film() RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO deleting_film_rows (film_id, last_update)
        VALUES (OLD.film_id, NOW());
        RETURN OLD;
    END;
$$ LANGUAGE plpgsql;

-- Create the trigger
CREATE TRIGGER delete_film_trigger
    AFTER DELETE ON film
    FOR EACH ROW
    EXECUTE PROCEDURE delete_table_film();