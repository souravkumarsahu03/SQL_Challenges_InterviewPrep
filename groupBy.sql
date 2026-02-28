CREATE DATABASE pracSet;
USE pracSet;

CREATE TABLE det(
customer_id INT UNIQUE,
cust_name VARCHAR(30),
state VARCHAR(30),
gender ENUM('Male','Female','Others'),
salary INT,
designation VARCHAR(25)
);

INSERT INTO det (customer_id, cust_name, state, gender, salary, designation) VALUES
(1, 'Rohit Sharma', 'Maharashtra', 'Male', 85000, 'Team Lead'),
(2, 'Anjali Mehta', 'Gujarat', 'Female', 45000, 'Junior Analyst'),
(3, 'Arjun Reddy', 'Telangana', 'Male', 110000, 'Data Scientist'),
(4, 'Meera Iyer', 'Tamil Nadu', 'Female', 90000, 'Software Engineer'),
(5, 'Sanjay Patel', 'Delhi', 'Male', 75000, 'Marketing Manager'),
(6, 'Shreya Das', 'West Bengal', 'Female', 50000, 'HR Generalist'),
(7, 'Amit Singh', 'Uttar Pradesh', 'Male', 60000, 'Sales Executive'),
(8, 'Divya Kumar', 'Karnataka', 'Female', 120000, 'Project Manager'),
(9, 'Praveen Rao', 'Andhra Pradesh', 'Male', 40000, 'Technical Support'),
(10, 'Kavya Rao', 'Telangana', 'Female', 150000, 'Solutions Architect');

SELECT * FROM det;

# GROUP BY 
SELECT gender, AVG(salary)
FROM det
GROUP BY gender;

# HAVING 
SELECT gender, AVG(salary), COUNT(*) AS total_data
FROM det
GROUP BY gender  
HAVING AVG(salary) > 80000;

# WITH ROLLUP --> TO get subtotal and grand total from the output column.
SELECT gender, SUM(salary), COUNT(*) AS total_data
FROM det
GROUP BY gender WITH ROLLUP ;  

# Using all the Clauses
SELECT state, COUNT(cust_name)
FROM det
GROUP BY state WITH ROLLUP
HAVING AVG(salary) > 50000;