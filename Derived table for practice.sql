-- Create database
CREATE DATABASE shopdb;

-- Use it
USE shopdb;

-- Create sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product VARCHAR(50),
    category VARCHAR(50),
    amount DECIMAL(10,2),
    sale_date DATE
);

-- Insert some dummy data
INSERT INTO sales (sale_id, product, category, amount, sale_date) VALUES
(1, 'Laptop', 'Electronics', 60000, '2025-01-10'),
(2, 'Mobile', 'Electronics', 25000, '2025-01-12'),
(3, 'Tablet', 'Electronics', 30000, '2025-01-13'),
(4, 'Shirt', 'Clothing', 2000, '2025-01-14'),
(5, 'Jeans', 'Clothing', 3500, '2025-01-15'),
(6, 'Shoes', 'Clothing', 4000, '2025-01-16'),
(7, 'Book', 'Stationery', 500, '2025-01-17'),
(8, 'Pen', 'Stationery', 50, '2025-01-17'),
(9, 'Notebook', 'Stationery', 150, '2025-01-18'),
(10, 'Headphones', 'Electronics', 5000, '2025-01-19');


SELECT * FROM sales;

SELECT sale_id, sale_date
FROM sales
WHERE product = 'Laptop'
GROUP BY sale_id, sale_date;


SELECT product, amount
FROM sales;


-- Find the total sales per category, then select only categories with sales above 40,000.
# Use subquery 
SELECT category, SUM(amount) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(amount) > 40000;


# Use derived table
SELECT category, total_sales
FROM (
	SELECT category, SUM(amount) AS total_sales 
    FROM sales 
	GROUP BY category
) as sale
WHERE total_sales > 40000;

