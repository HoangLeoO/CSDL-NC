drop database if exists demo_review ;
create database demo_review ;
use demo_review;


create table customers (
 customerId INT (11) AUTO_INCREMENT PRIMARY KEY ,
 lastName  VARCHAR (20)  DEFAULT NULL,
 firstName  VARCHAR (20)  DEFAULT NULL,
 phone INT(11) NOT NULL ,
 city VARCHAR (20)  DEFAULT NULL,
 country VARCHAR (20)  DEFAULT NULL ,
 hireDate date 
);


-- Lệnh INSERT dùng để thêm mới dữ liệu vào bảng (Table).
insert into customers(lastName,firstName,phone,city,country,hireDate) value ('Hoang','Le','0932568991','Da Nang','VN','2008-04-21');
insert into customers(lastName,firstName,phone,city,country,hireDate) value ('Jone','Will','0932568991','Da Nang','VN', '2008-04-23');
insert into customers(lastName,firstName,phone,city,country ,hireDate) value ('Norway','Tom','0932568991','Da Nang','VN','2008-04-24');
insert into customers(lastName,firstName,phone,city,country,hireDate) value ('Stavanger','Jack','0932568991','Da Nang','VN','2008-04-25');
insert into customers(lastName,firstName,phone,city,country,hireDate) value ('Cardinal','Le','0932568991','Da Nang','VN','2008-04-26');
insert into customers(lastName,firstName,phone,city,country,hireDate) value ('Stavanger','Le','0932568991','Da Nang','VN','2008-04-27');

-- Lệnh UPDATE dùng để sửa dữ liệu hiện có trong bảng (Table).
-- Có thể sửa nhiều dòng tại một thời điểm.

UPDATE customers SET LastName = 'Phuong' WHERE customerId = 1 ;

-- Lệnh DELETE dùng để xóa dữ liệu đang tồn tại trong bảng (Table).
delete from customers where customerId = '1' ; 


