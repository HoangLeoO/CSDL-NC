
use qlht;


DELIMITER $$
-- tạo một even sau 30 phút thì thêm dữ liệu vào bảng countries

Create event evt_IsCountries
on schedule at current_timestamp + interval 30 minute
on completion preserve
do 
    insert into countries (country_id, country_name, egion_id)
	values('ZW','Zimbabwe',4);
    
-- tạo một event sau 2 ngày thì chọn những người có lương trên 5000
Create event evt_IsEmployees
on schedule at current_timestamp + interval 2 day
on completion preserve
do 
    select *
	from employees
	where salary > 5000 ;
    
delimitter ;