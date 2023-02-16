use qlht;
-- CAU 1 --
-- tao trigger thong bao loi khi nhap ten country da co san --

delimiter $$
create trigger trigg_country_insert
	before insert
	ON countries
    for each row
    BEGIN
		if exists ((select * from countries where country_name = new.country_name)) THEN
        signal sqlstate '45000'
        set MESSAGE_TEXT = 'COUNTRY NAME HAS BEEN EXISTED';
        end if;
	end$$
delimiter $$



-- tao trigger thong bao loi khi xoa nhan vien co nam lam viec < 10 years - 30 years  --

delimiter $$
create trigger trigg_delete_employee
	before delete
	ON employees
    for each row
    BEGIN
		if (timestampdiff(year, old.hire_date, now()) > 10 and timestampdiff(year, old.hire_date, now()) < 30) THEN
			signal sqlstate '45000'
			set MESSAGE_TEXT = 'day la nhan vien thuong nien';
		end if;
	end$$
delimiter $$

-- TAO EVENT tai gio nay ngay mai them 1 quoc gia   --
delimiter $$
CREATE EVENT IF NOT EXISTS event_insert_country
on schedule at current_timestamp + interval 1 day
DO
BEGIN
	INSERT INTO countries(country_id, country_name, region_id)
    VALUES ('MR', 'ALATISS MEMORY', '3') ;
    END $$

-- tao event xoa nhan vien co luong thap nhat --
delimiter $$
CREATE EVENT event_delete_employee
on schedule at current_timestamp + interval 1 day
do
begin
	DELETE FROM employees where salary < 3000 ;
    end $$
