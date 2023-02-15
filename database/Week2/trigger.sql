use qlht;

--  tạo trigger báo lỗi khi insert cột max , min salary < 0 thì báo lỗi
DELIMITER 
DROP TRIGGER IF EXISTS BEFORE_PROUCT_INSERT_VALIDATION;
create trigger BEFORE_PROUCT_INSERT_VALIDATION
before insert on jobs 
for each row
BEGIN 
	IF(new.min_salary < 0 or new.max_salary < 0) then 
    SIGNAL SQLSTATE '45000'
    set message_text = 'the min salary or max salary value must > 0 ';
    end if;
end$$

DELIMITER $$
DROP TRIGGER IF EXISTS BEFORE_PROUCT_UPDATE_VALIDATION;
create trigger BEFORE_PROUCT_UPDATE_VALIDATION
before update on jobs 
for each row
BEGIN 
	IF(new.min_salary < 0 or new.max_salary < 0) then 
    SIGNAL SQLSTATE '45000'
    set message_text = 'the min salary or max salary value must > 0 ';
    end if;
end$$

UPDATE jods set min_salary = -1000 WHERE id = '1';


-- INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (20,'Stock Manager',-5500.00,-8500.00);
-- update jobs set max_salary = -1 where job_id = 1 ;

-- set global event_scheduler = on ;
-- show processlist ;


