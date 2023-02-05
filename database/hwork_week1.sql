use qlht;

-- Tạo một thủ tục  có tên là pro_Salary  để xét thưởng cuối năm như sau 
-- - Nếu nhân viên làm trên : >= 9 năm thì hưởng lương là 12 tr 
-- - Nếu làm trên 6 năm thì thưởng 8 tr
-- - Nếu làm trên 4 năm thì thưởng 6 tr
-- - Còn lại thì thưởng 5tr 
drop procedure pro_Salary ;
delimiter $$
create procedure pro_Salary ()
begin
 select first_name ,  last_name , (YEAR(CURDATE()) - YEAR(hire_date)) AS years ,
case 
when (YEAR(CURDATE()) - YEAR(hire_date)) >= 9 then 12000
when (YEAR(CURDATE()) - YEAR(hire_date)) > 6 then 8000
when (YEAR(CURDATE()) - YEAR(hire_date)) > 4 then 6000
else 5000
end as bonus FROM employees;
end;
$$

call pro_Salary();

-- Tạo Pro_Search_name(first_name)
--  sau đó hiển thị toàn bộ thông tin của nhân viên đó
--  trong đó nối họ và tên  Firt_name + late_name = full name 

drop procedure  Pro_Search_name ;
delimiter $$ 

create procedure Pro_Search_name (first_name varchar(30))
begin
select CONCAT(first_name , " ", last_name) as full_name ,email, phone_number, hire_date, job_id, salary, manager_id, department_id 
from employees where first_name = first_name ;
end ;
$$

call Pro_Search_name('Neena') ;