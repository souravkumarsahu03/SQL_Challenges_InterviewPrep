-- =========================================================
-- Full demo: Window Functions in MySQL (incl. PERCENT_RANK, CUME_DIST)
-- =========================================================

-- Create (if needed) and switch to a clean database
CREATE DATABASE IF NOT EXISTS companydb2;
USE companydb2;

DROP database companydb2;

-- Base table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

-- Sample data
INSERT INTO employees (name, department, salary, hire_date) VALUES
('Alice',   'IT',      70000, '2020-01-10'),
('Bob',     'IT',      80000, '2019-03-15'),
('Charlie', 'IT',      70000, '2021-06-01'),     -- tie in IT to show rank behavior
('Hannah',  'IT',      72000, '2022-02-14'),
('David',   'HR',      75000, '2018-08-20'),
('Eve',     'HR',      50000, '2017-05-10'),
('Frank',   'Finance', 85000, '2020-09-25'),
('Grace',   'Finance', 75000, '2021-11-30'),
('Ivy',     'Finance', 85000, '2019-04-05');     -- tie in Finance

INSERT INTO employees (name, department, salary, hire_date) VALUES
('Sourav', 'IT',      75000, '2022-05-01'),
('Manish', 'HR',      60000, '2021-06-10'),
('Ramesh', 'Testing',      37000, '2023-03-11'),
('Sudarshan', 'Testing',  47000, '2021-03-11'),
('Chaitanya', 'IT',      85000, '2021-09-01');

INSERT INTO employees (name, department, salary, hire_date) VALUES
('Guru', 'Testing',      25000, '2021-09-01'),
('Sahil', 'Testing',      85000, '2023-05-11'),
('Sanskar', 'Testing',      75000, '2022-03-22');

SELECT * FROM employees;

-- ---------------------------------------------------------
-- 1) ROW_NUMBER(): unique sequence within each department
-- ---------------------------------------------------------



-- Duplicates are not allowed in ROW_NUMBER()


---------------------------------------------------------
-- 2) RANK(): ranks with gaps on ties (1,1,3)
-- ---------------------------------------------------------



-- ---------------------------------------------------------
-- 3) DENSE_RANK(): ranks without gaps on ties (1,1,2)
-- ---------------------------------------------------------

-- ---------------------------------------------------------
-- 4) NTILE(3): split each department into 3 buckets by salary
-- ---------------------------------------------------------


-- ---------------------------------------------------------
-- 5) LAG(): previous row's salary by hire_date in each department
-- ---------------------------------------------------------


-- ---------------------------------------------------------
-- 6) LEAD(): next row's salary by hire_date in each department
-- ---------------------------------------------------------


-- ---------------------------------------------------------
-- 7) FIRST_VALUE(): earliest hire's salary in each department
-- ---------------------------------------------------------


-- ---------------------------------------------------------
-- 8) LAST_VALUE(): latest hire's salary in each department
--    (requires a full-frame to see the true last value)
-- ---------------------------------------------------------


-- ---------------------------------------------------------
-- 9) SUM() OVER: running total of salaries by hire_date per dept
-- ---------------------------------------------------------

-- ---------------------------------------------------------
-- 10) AVG() OVER: department average salary on every row
-- ---------------------------------------------------------



-- ---------------------------------------------------------
-- 11) PERCENT_RANK(): relative rank in [0,1]
--     Formula: (rank - 1) / (rows_in_partition - 1)
--     With ORDER BY salary DESC, the highest salaries get 0.0
-- ---------------------------------------------------------



-- ---------------------------------------------------------
-- 12) CUME_DIST(): cumulative distribution in (0,1]
--     Fraction of rows in the partition with value >= current
--     (because we ORDER BY salary DESC)
-- ---------------------------------------------------------
