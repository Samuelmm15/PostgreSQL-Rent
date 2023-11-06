-- TRIGGER THAT INSERTS A NEW ROW IN THE TABLE updated_table_film EVERY TIME A ROW IS INSERTED IN THE TABLE film

-- DELETING THE FUNCTION IF EXISTS
DROP FUNCTION IF EXISTS insert_table_film() CASCADE;

-- First we create the function
CREATE FUNCTION insert_table_film() RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO updated_table_film (last_update) VALUES (NOW());
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

-- Then we create the trigger
CREATE TRIGGER trigger_insert_table_film
AFTER INSERT ON film
FOR EACH ROW
EXECUTE FUNCTION insert_table_film();
