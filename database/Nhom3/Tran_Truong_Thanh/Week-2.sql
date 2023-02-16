use qlht;
-- bai tập 


DELIMITER $$
CREATE TRIGGER
AFTER_UPDATE_JOB
BEFORE UPDATE ON jobs
FOR EACH ROW
BEGIN
	UPDATE employees
    SET employees.salary = NEW.max_salary
    WHERE employees.salary > NEW.max_salary;
end$$

DELIMITER $$
CREATE TRIGGER
AFTER_UPDATE_TANG_LUONG
BEFORE UPDATE ON jobs
FOR EACH ROW
BEGIN
	UPDATE employees
    SET employees.salary = NEW.min_salary
    WHERE employees.salary < NEW.min_salary;
end$$

select * from employees;
select * from jobs;

SET SQL_SAFE_UPDATES=0;
update jobs
set min_salary = 25000
where job_id = 4;




CREATE EVENT tang_luong_10_phan_tram_moi_10_giay
ON SCHEDULE at current_timestamp + interval 10 second
DO
UPDATE employees
SET employees.salary = employees.salary + employees.salary / 10;

CREATE EVENT event12312
ON SCHEDULE at '2023-02-16 18:30:00'
DO
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id)
VALUES (998,'Nguyen','Thanh','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);

