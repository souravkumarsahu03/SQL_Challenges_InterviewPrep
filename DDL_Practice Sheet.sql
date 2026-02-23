#How to know what are the databases already present in your databases?
SHOW databases;

#How to create a database?
CREATE database Practice1;

# After creating, can I directly use database? If no, then how to use ?
USE Practice1;

-- Let's start with DDL Commands

# How to create a table ? 
CREATE table Batch409(
name varchar(40),
gender char(1)
);

# How to alter a table by adding a column (with dtype) to the table?
ALTER table Batch409
ADD course varchar(30);

# How to alter a table by adding a column (with dtype) to the table after a particular existing column?
ALTER table Batch409
ADD graduation_year int
AFTER gender;

# How to alter a table by changing a column (with dtype) at the same time?
ALTER table Batch409
CHANGE COLUMN graduation_year 
grad_course varchar(20);

# How to alter a table by modifying the column name with new dtype?
ALTER table Batch409
MODIFY gender varchar(10);

# How to alter a table by renmaing the column to a new column name?
ALTER table Batch409
RENAME COLUMN 
grad_course TO degree;

# How to 'alter' table to 'drop' a specific column?
ALTER table Batch409
DROP COLUMN degree;

# How to DROP a table?
DROP table Batch409;

# How to drop a database?
DROP database practice1;


DESC Batch409;
SELECT * FROM batch409;