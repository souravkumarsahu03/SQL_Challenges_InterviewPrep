CREATE DATABASE Interview_Prep;
USE Interview_Prep;

-- 1. Create Category table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

-- 2. Create Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- 3. Create Employees Table (Self-referencing for Manager questions)
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    manager_id INT,
    hire_date DATE,
    FOREIGN KEY (manager_id) REFERENCES Employees(employee_id)
);

-- 4. Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    employee_id INT,
    sale_date DATE,
    quantity INT,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);


INSERT INTO Categories VALUES (1, 'Electronics'), (2, 'Furniture'), (3, 'Stationery');

INSERT INTO Products VALUES 
(101, 'Laptop', 1, 1200.00), (102, 'Smartphone', 1, 800.00), 
(103, 'Office Chair', 2, 250.00), (104, 'Desk', 2, 500.00), 
(105, 'Notebook', 3, 5.00);

INSERT INTO Employees VALUES 
(1, 'Sourav', 'IT', 95000, NULL, '2023-01-15'),
(2, 'Aditi', 'Sales', 75000, 1, '2023-03-10'),
(3, 'Rahul', 'Sales', 60000, 2, '2023-06-20'),
(4, 'Priya', 'IT', 85000, 1, '2023-02-01'),
(5, 'Amit', 'Marketing', 70000, NULL, '2023-08-15');

INSERT INTO Employees VALUES 
(6, 'Manish', 'IT', 87000, NULL, '2023-01-15');

INSERT INTO Sales (product_id, employee_id, sale_date, quantity, total_amount) VALUES 
(101, 2, '2025-01-05', 1, 1200.00), (102, 3, '2025-01-06', 2, 1600.00),
(103, 2, '2025-01-07', 3, 750.00), (101, 3, '2025-02-01', 1, 1200.00),
(104, 2, '2025-02-05', 1, 500.00), (105, 3, '2025-02-10', 10, 50.00);



SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Employees;
SELECT * FROM Sales;


-- -------------------------------------------------------------------
-- QUESTIONS 

-- 1)  Find the 3rd highest salary in each department. If two employees have the same salary, they should share the same rank.

WITH salary_rank AS(
	SELECT name, department, salary,
	DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS 'Third_Highest_Salary'
	FROM Employees
)
SELECT name, department, salary 
FROM salary_rank
WHERE Third_Highest_Salary = 3;

-- 2)  Calculate the cumulative sum of sales for each month in 2025.
SELECT * FROM Sales;

SELECT sale_id,product_id,sale_date,
	SUM(total_amount) OVER(ORDER BY sale_date) AS 'TOTAL_SALES'
FROM Sales 
WHERE YEAR(sale_date) = 2025;

-- 3) Find the difference in sales between the current month and the previous month for each product.
 SELECT * FROM Products;
 
 SELECT product_name, unit_price,
 