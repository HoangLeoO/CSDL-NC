use demo_review;


-- Lệnh SELECT dùng để xác định các cột hiển thị.
select * from customers ;

select lastName , phone from customers ; 

-- lệnh as dùng để thay thế tên cột mặc định
select customerId as MaKH , lastName , firstName from customers ;

-- distinct dùng để loại bỏ những dòng trùng nhau 
select distinct firstName from customers ; 
-- Mệnh đề TOP dùng để giới hạn số dòng kết quả. (dùng ở sql sever)
-- Thường sử dụng với mệnh đề ORDER BY.
-- SELECT TOP(3)
-- FROM customers
-- ORDER BY hireDate ASC ;
--  
-- SELECT TOP(3)
-- FROM customers
-- ORDER BY hireDate DESC ;