-- Tạo event chèn dữ liệu sau 30 giây kết thúc sau 1 phút
DROP EVENT IF EXISTS employees_insert;
CREATE EVENT IF NOT EXISTS employees_insert
ON SCHEDULE EVERY 30 SECOND
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
	INSERT INTO employees(employee_id, first_name, last_name, email,phone_number, hire_date, job_id, salary, manager_id, department_id) VALUES 
    (207,'Nguyen','Ton','nguyen.gietz@sqltutorial.org','315.323.7181','1994-06-07',2,8300.00,204,12);

-- Tạo event chèn dữ liệu vào 18 giờ 30 phút ngày 16 tháng 02 năm 2023
DROP EVENT IF EXISTS insert_employees_data;
CREATE EVENT insert_employees_data
ON SCHEDULE AT '2023-02-16 18:30:00'
DO
INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id)
VALUES ('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2022-02-15', 1, 50000.00, 210, 3);
