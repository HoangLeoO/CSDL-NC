drop database if exists sell; 
create database sell ;
use sell ; 

create table offices(
 officeCode INT (11) AUTO_INCREMENT PRIMARY KEY ,
 city VARCHAR (40) DEFAULT NULL ,
 phone VARCHAR (40) DEFAULT NULL ,
 addressLine1 VARCHAR (40) DEFAULT NULL,
 addressLine2 VARCHAR (40) DEFAULT NULL,
 state  VARCHAR (40) DEFAULT NULL,
 country VARCHAR (40) DEFAULT NULL,
 postalCode INT (11) NOT NULL ,
 territory  VARCHAR (40) DEFAULT NULL
);


create table employees (
 employeeNumber INT (11) AUTO_INCREMENT PRIMARY KEY,
 lastName VARCHAR (40) DEFAULT NULL ,
 firstName VARCHAR (40) DEFAULT NULL ,
 extension VARCHAR (40) DEFAULT NULL ,
 email  VARCHAR (40) DEFAULT NULL ,
 officeCode  INT (11) NOT NULL ,
 reportsTo VARCHAR (40) DEFAULT NULL ,
 jodTitle VARCHAR (40) DEFAULT NULL ,
 FOREIGN KEY (officeCode) REFERENCES offices (officeCode) ON DELETE CASCADE ON UPDATE CASCADE
);

create table productLines (
 productLine   INT (11) AUTO_INCREMENT PRIMARY KEY ,
 textDescription VARCHAR (40) DEFAULT NULL ,
 htmlDescription VARCHAR (40) DEFAULT NULL ,
 image VARCHAR (40) DEFAULT NULL 
);

create table products (
 productCode  INT (11) AUTO_INCREMENT PRIMARY KEY,
 productName VARCHAR (40) DEFAULT NULL ,
 productLine  INT (11) NOT NULL ,
 productScale VARCHAR (40) DEFAULT NULL ,
 productVendor VARCHAR (40) DEFAULT NULL ,
 productDescription VARCHAR (40) DEFAULT NULL ,
 quanitylnStock VARCHAR (40) DEFAULT NULL ,
 buyPrice VARCHAR (40) DEFAULT NULL ,
 MRSP VARCHAR (40) DEFAULT NULL ,
 FOREIGN KEY (productLine) REFERENCES productLines (productLine) ON DELETE CASCADE ON UPDATE CASCADE
);



create  table customers (
customerNumber INT (11) AUTO_INCREMENT PRIMARY KEY ,
customerName  VARCHAR (40) DEFAULT NULL,
customerLastName  VARCHAR (40) DEFAULT NULL,
customerFirstName  VARCHAR (40) DEFAULT NULL,
phone VARCHAR (40) DEFAULT NULL, 
addressLine1 VARCHAR (40) DEFAULT NULL,
addressLine2 VARCHAR (40) DEFAULT NULL,
city VARCHAR (40) DEFAULT NULL,
sale VARCHAR (40) DEFAULT NULL,
postalCode VARCHAR (40) DEFAULT NULL,
coutry VARCHAR (40) DEFAULT NULL,
saleRepEmployeeNumber INT (11) NOT NULL,
creditLimit VARCHAR (40) DEFAULT NULL ,
 FOREIGN KEY (saleRepEmployeeNumber) REFERENCES employees (employeeNumber) ON DELETE CASCADE ON UPDATE CASCADE
);

create table orders(
orderNumber  INT (11) AUTO_INCREMENT PRIMARY KEY ,
orderDate DATE NOT NULL ,
requiredDate  DATE NOT NULL,
shipperDate  DATE NOT NULL,
status  VARCHAR (40) DEFAULT NULL,
comments VARCHAR (40) DEFAULT NULL,
customerNumber INT(11) NOT NULL ,
FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE CASCADE ON UPDATE CASCADE
);
create table orderDetails (
orderNumber  INT (11) NOT NULL  ,
productCode  INT (11) NOT NULL  ,
quantityOrdered   INT (11) NOT NULL ,
priceEach  INT (11) NOT NULL  ,
orderLineNumber    INT (11) NOT NULL ,
 FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (productCode) REFERENCES products (productCode) ON DELETE CASCADE ON UPDATE CASCADE
);

create table payMents(
checkNumber INT (11) AUTO_INCREMENT PRIMARY KEY  ,
customerNumber INT (11) NOT NULL ,
paymentDate date not null ,
amout  INT (11) NOT NULL ,
FOREIGN KEY (customerNumber) REFERENCES customers (customerNumber) ON DELETE CASCADE ON UPDATE CASCADE
);

