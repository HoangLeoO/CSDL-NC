-- Ví dụ thứ nhất
DROP TRIGGER IF EXISTS employee_insert_audit;
DELIMITER $$
CREATE TRIGGER employee_insert_audit
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO dependents (employee_id)
    VALUES (NEW.employee_id);
END;

-- Ví dụ thứ 2
DROP TRIGGER IF EXISTS before_insert_employees;
DELIMITER $$
CREATE TRIGGER before_insert_employees
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    DECLARE department_count INT;
    SELECT COUNT(*) INTO department_count FROM departments WHERE department_id = NEW.department_id;
    IF department_count = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Department does not exist';
    END IF;
END;