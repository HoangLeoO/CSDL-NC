use qlht;

-- Câu view : Tạo View hiển thị tất cả thông tin nhân viên  có việc làm là Stock Manager


-- Tạo view
-- Create View View_Demo as 
-- SELECT region_name , country_name , street_address ,postal_code ,city ,state_province  
-- FROM regions as R Left join  countries as C on R.region_id = C.region_id 
-- Left join locations as L on c.country_id = L.country_id;

create view View_Jobs as select firstName , lastName ,email ,phone