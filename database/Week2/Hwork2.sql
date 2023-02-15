use qlht;

-- TRIGGER
-- Tạo trigger khi tạo nhân viên email không được phép trùng lặp

DROP TRIGGER IF EXISTS AFTER_PROUCT_UPDATE_VALIDATION;
DELIMITER $$
CREATE TRIGGER AFTER_EMPLOYEES_INSERT_VALIDATION
AFTER INSERT ON employees 
FOR EACH ROW 
BEGIN 
   
   IF( (SELECT count(*)  FROM employees where email = new.email)  >1) THEN SIGNAL  SQLSTATE '45001' SET message_text = "Email đã được sử dụng !" ;
   END IF;
END $$

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (207,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);

-- Tạo trigger kiểm tra nhân viên khi nhập cột salary  không được nhỏ hơn 1000
DROP TRIGGER IF EXISTS AFTER_EMPLOYEES_SALAR_VALIDATION;
DELIMITER $$
CREATE TRIGGER AFTER_EMPLOYEES_SALARY_INSERT_VALIDATION
AFTER INSERT ON employees 
FOR EACH ROW 
BEGIN 
   
   IF( new.salary <1000) THEN SIGNAL  SQLSTATE '45001' SET message_text = "Salary không được nhỏ hơn  1000 !" ;
   END IF;
END $$

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (208,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,999.00,205,11);



-- EVENT 
SHOW PROCESSLIST;
SET GLOBAL event_scheduler = ON;
SHOW PROCESSLIST;

-- Tao event them 1 employee sau 20s 
CREATE EVENT UPDATE_EMPLOYEE 
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 20 SECOND 
ON COMPLETION PRESERVE	
DO
UPDATE employees set salary = 999999.00 where employee_id = 100 ;


-- Tao event xoa 1 employee sau 40s 
CREATE EVENT DELETE_EMPLOYEE 
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 40 SECOND 
ON COMPLETION PRESERVE	
DO
DELETE FROM employees where employee_id = 100;

SHOW EVENTS FROM qlht;

-- Tạo một event trong đó sét time sau 1h thì thực hiện chèn dữ liệu vào cho bảng employee

CREATE EVENT INSERT_EMPLOYEE 
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 HOUR  
ON COMPLETION PRESERVE	
DO
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) 
VALUES (208,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,1999.00,205,11);