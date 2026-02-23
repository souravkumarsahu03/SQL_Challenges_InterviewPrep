CREATE database ProductDB;
DROP database ProductDB;
USE ProductDB;

CREATE table Products(
ProductID int,
ProductName varchar(50),
Category varchar(20),
Price int,
StockQuantity int,
ManufactureDate date,
ExpiryDate date,
SupplierName varchar(20)
);

SELECT * FROM Products;


# Add a column named Description to the Products table.
ALTER table Products ADD Description varchar(50);


#Modify the Data Type of a Column
ALTER table Products MODIFY Description char;

DESC Products;

#Change the data type of the Category column.
ALTER table Products MODIFY Category char(1);

#Remove the ExpiryDate column from the Products table.
ALTER TABLE Products 
DROP COLUMN ExpiryDate;

#Rename the Price column to ProductPrice.
ALTER TABLE Products
RENAME COLUMN
Price TO ProductPrice;


#Add a unique constraint to the ProductName column.
ALTER TABLE Products
MODIFY ProductName varchar(50) UNIQUE;

#Remove the unique constraint from the ProductName column.
ALTER TABLE Products
DROP CONSTRAINT ProductName;

#Insert 10 rows in table using all forms
INSERT INTO Products VALUES(101,'Bhujia Sev','U',120,4,'2024-12-20','Haldiram','A'),
(102,'SOAP','U',520,4,'2020-02-10','MENS COLL','B'),
(103,'Bread','H',20,3,'2022-11-01','Qwality','A'),
(104,'Tennis Ball','H',60,5,'2024-12-20','Rapid','B'),
(105,'Shoes','F',3400,2,'2025-04-10','Nike','E'),
(106,'Mango','E',110,8,'2024-10-12','Ram','A'),
(107,'Pen','U',10,10,'2019-11-10','Classmate','O'),
(108,'Laptop','T',70000,1,'2025-08-19','HP','O'),
(109,'Notebook','U',60,4,'2023-10-12','TruNote','A'),
(110,'Mobile','U',12000,2,'2024-11-19','Motorola','B');

SELECT * FROM Products;

#Use update command
set sql_safe_updates = 0;
UPDATE Products
SET ProductPrice = ProductPrice + 50 
WHERE Category = 'U';

#Use Delete command
DELETE FROM Products
WHERE ProductPrice > 1000;
