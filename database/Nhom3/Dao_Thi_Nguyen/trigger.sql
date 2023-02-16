--tạo trigger thêm region_id vào country_name
DELIMITER $$
CREATE TRIGGER after_country_insert_validation
AFTER INSERT ON countries
FOR EACH ROW
BEGIN
    insert into regions(region_id)
	values (new.country_name)
END;

-- tạo trigger để kiểm tra khi nhập cột max_salary không được lớn hơn 10000
DELIMITTER $$
create trigger before_jobs_update_validation
before update on jobs
for each row
begin
   if (new.max_salary > 10000) then
   signal sqlstate '4500'
   set message_text = ' max_salary không được lớn 10000';
   end if;
end$$

