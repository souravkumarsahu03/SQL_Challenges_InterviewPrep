CREATE DATABASE InterviewPrep;
USE InterviewPrep;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    manager_id INT,
    salary DECIMAL(10,2),
    department VARCHAR(50),
    join_date DATE
);



CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);



CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);


CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- PRACTICE QUESTIONS

-- 1) Write a query to fetch the first_name and last_name from the Employees table.
SELECT * FROM Employees;
SELECT first_name, last_name 
FROM Employees;

-- 2) Find all customers located in 'USA' or 'UK'.
SELECT * FROM customers
WHERE country IN ('USA','UK');

-- 3) List all products that have a stock quantity between 10 and 50. 
SELECT * FROM products
WHERE stock_quantity BETWEEN 10 AND 50;

-- 4) Retrieve orders placed in the last 30 days.
SELECT * FROM orders
ORDER BY order_date DESC
LIMIT 30;

-- 5) Find all employees whose first_name starts with 'A' and ends with 'n'.
SELECT * FROM employees
WHERE first_name LIKE 'A%' and first_name LIKE '%y';

-- 6) Select distinct categories from the Products table.
SELECT DISTINCT(category) as 'Distinct_Category'
FROM products;

SELECT * FROM products;

-- 7) List all products sorted by price in descending order.
SELECT * FROM products
ORDER BY price DESC;


-- 8) Find the top 5 highest-paid employees.
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 5;

-- USING WINDOWS FUNCTION
SELECT emp_id, CONCAT(first_name, ' ', last_name) as 'Emp_name', salary, department,
RANK() OVER(PARTITION BY department ORDER BY salary DESC) as 'Top 5'
FROM employees
LIMIT 5; 

-- 9) Show all orders that are not 'Shipped'.
SELECT * FROM orders
WHERE status <> 'Shipped' and status <> 'Delivered';

-- 10) Retrieve the names of customers who do not have a country assigned (NULL check).
SELECT * FROM customers
WHERE country IS NULL;


-- 11) Write an Inner Join to show customer_name and their corresponding order_date.
SELECT c.customer_name, o.order_date 
FROM customers as c
INNER JOIN orders as o ON c.customer_id = o.customer_id;



-- 12) Perform a Left Join to list all customers and the orders they placed (including those who placed none).
SELECT * FROM customers as c
LEFT JOIN orders as o ON c.customer_id = o.customer_id;


-- 13) Find the names of products and the total quantity sold for each.
SELECT p.product_name, COUNT(o.quantity) AS 'Total_quantity'  
FROM products as p
JOIN order_items as o ON p.product_id = o.product_id
GROUP BY p.product_name;


-- 14) Join Employees with itself (Self Join) to show Employee Name and their Manager Name.
SELECT b.first_name, concat_ws(' ', e.first_name,e.last_name) as 'manager name' FROM employees e
INNER JOIN employees b ON e.emp_id = b.manager_id;

SELECT * FROM employees;


-- 15) Retrieve the total amount spent by each customer (Join Customers and Orders).
SELECT c.customer_name, SUM(o.total_amount) AS 'Total amount spent'
FROM customers as c
JOIN orders as o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;


-- 16) Find products that have never been ordered (using LEFT JOIN).
SELECT DISTINCT(p.product_name), a.status 
FROM products as p
JOIN order_items as o ON p.product_id = o.product_id
LEFT JOIN orders as a ON o.order_id = a.order_id;

SELECT * FROM orders;

-- 17) List all orders along with the product names included in those orders.
SELECT o.*, p.product_name 
FROM orders as o
JOIN order_items as a on o.order_id = a.order_id
JOIN products as p on a.product_id = p.product_id;

SELECT * FROM order_items;
SELECT * FROM employees;
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM customers;

-- 18) Show the department name and the total number of employees in each.
SELECT department, COUNT(department) as 'Total number of emp'
FROM employees
GROUP BY department WITH ROLLUP;

-- 19) Find the customer_name and the specific items they bought (3-table join).
SELECT DISTINCT(c.customer_name), p.product_name
FROM customers as c
JOIN orders as o ON c.customer_id = o.customer_id
JOIN order_items as om ON o.order_id = om.order_id
JOIN products as p ON om.product_id = p.product_id;

-- 20) Display all orders where the total amount is greater than the average order amount.
SELECT order_id, SUM(total_amount) as 'Total Amount' FROM orders
WHERE Total_Amount > (SELECT AVG(total_amount) FROM orders)
GROUP BY order_id;