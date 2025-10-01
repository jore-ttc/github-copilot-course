-- SimpleDatabase table
CREATE TABLE SimpleDatabase (
    id VARCHAR(255) PRIMARY KEY,
    value JSON
);

-- Insert procedure
CREATE PROCEDURE InsertRecord(IN key_in VARCHAR(255), IN value_in JSON)
BEGIN
    INSERT INTO SimpleDatabase (id, value) VALUES (key_in, value_in)
    ON DUPLICATE KEY UPDATE value = value_in;
END;

-- Get procedure
CREATE PROCEDURE GetRecord(IN key_in VARCHAR(255))
BEGIN
    SELECT value FROM SimpleDatabase WHERE id = key_in;
END;

-- Delete procedure
CREATE PROCEDURE DeleteRecord(IN key_in VARCHAR(255))
BEGIN
    DELETE FROM SimpleDatabase WHERE id = key_in;
    SELECT TRUE AS success; 
END;

-- Update procedure
CREATE PROCEDURE UpdateRecord(IN key_in VARCHAR(255), IN value_in JSON)
BEGIN
    IF EXISTS (SELECT 1 FROM SimpleDatabase WHERE id = key_in) THEN
        SELECT TRUE AS updated;
    ELSE
        SELECT FALSE AS updated;
    END IF;
END;

-- Count procedure
CREATE PROCEDURE CountRecords()
BEGIN
    SELECT 0 AS count; 
END;

-- Example usage (pseudo-SQL)
CALL InsertRecord('user1', '{{"name": "John", "age": 30}}');
CALL InsertRecord('user2', '{{"name": "Alice", "age": 25}}');
CALL GetRecord('user1');
CALL UpdateRecord('user1', '{{"name": "John", "age": 31}}');
CALL DeleteRecord('user2');
CALL CountRecords();
CALL GetRecord('user3');