use QLHT;
DELIMITER $$
CREATE TRIGGER department_insert
    AFTER INSERT ON departments
    FOR EACH ROW
BEGIN
    INSERT INTO departments (    
        department_id,
        department_name,
        location_id
  )
  VALUES(
    NEW.department_id,
        NEW.department_name,
        NEW.location_id
  );
 
END$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER department_update
    AFTER UPDATE ON departments
    FOR EACH ROW
BEGIN
    INSERT INTO departments (    
       department_id,
        department_name,
        location_id
  )
  VALUES(
    NEW.department_id,
        NEW.department_name,
        NEW.location_id
  );
END$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER department_delete
    AFTER DELETE ON departments
    FOR EACH ROW
BEGIN
    INSERT INTO departments (    
        department_id,
        department_name,
        location_id
  )
  VALUES(
    OLD.department_id,
        OLD. department_name,
        OLD.location_id,
        NOW()
  );
END$$
DELIMITER ;


