use demo_review ;

-- Hàm UPPER chuyển đổi tất cả các chữ cái trong biểu thức chuỗi thành chữ hoa.
select upper(lastName) from customers ;

-- Hàm LOWER chuyển đổi tất cả các chữ cái trong biểu thức chuỗi thành chữ thường.
select LOWER(lastName) from customers ;

--  Hàm LEFT dùng để trích xuất một số ký tự từ chuỗi nguồn, bắt đầu từ bên trái.
SELECT LEFT('sql.edu.vn', 3) ;
SELECT LEFT(NULL, 3) ;

-- Hàm RIGHT dùng để trích xuất một số ký tự từ chuỗi nguồn, bắt đầu từ bên phải.
SELECT RIGHT('sql.edu.vn', 3) ;
SELECT RIGHT(NULL, 3) ;


-- Hàm SUBSTRING dùng để trích xuất một số ký tự từ chuỗi nguồn, bắt đầu từ vị trí chỉ định (từ trái qua phải).
SELECT SUBSTRING('sql.edu.vn', 5, 3) ;

--  Hàm TRIM dùng để xóa các khoảng trắng hai bên của biểu thức chuỗi.
	SELECT TRIM(' sql.edu.vn  ');
    
-- Hàm LTRIM dùng để xóa các khoảng trắng bên trái của biểu thức chuỗi.
SELECT LTRIM(' sql.edu.vn');

-- Hàm RTRIM dùng để xóa các khoảng trắng bên phải của biểu thức chuỗi.
SELECT RTRIM('sql.edu.vn ');


-- Hàm SPACE trả về một chuỗi có số lượng khoảng trắng được chỉ định trong biểu thức số.
SELECT SPACE(1) ;
SELECT SPACE(1-2) ;

-- Hàm CONCAT dùng để nối hai hay nhiều chuỗi thành một chuỗi duy nhất.
SELECT CONCAT('sql', '.edu', '.vn') ;
SELECT CONCAT('sql', '.edu', '.vn', NULL);



