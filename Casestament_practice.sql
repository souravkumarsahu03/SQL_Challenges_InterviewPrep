-- STEP 1: Create database
CREATE DATABASE case_study_numbers;

-- Use the new database
USE case_study_numbers;


-- STEP 2: Create table "numbers"
-- Columns: id (unique), num (the number itself)
CREATE TABLE numbers (
    num_id INT PRIMARY KEY AUTO_INCREMENT,  -- Unique ID
    num INT NOT NULL                        -- The number to test
);


-- STEP 3: Insert 20 dummy numbers
-- Mix of even and odd values
INSERT INTO numbers (num) VALUES
(5),    -- Odd
(8),    -- Even
(11),   -- Odd
(14),   -- Even
(17),   -- Odd
(20),   -- Even
(23),   -- Odd
(26),   -- Even
(29),   -- Odd
(32),   -- Even
(35),   -- Odd
(38),   -- Even
(41),   -- Odd
(44),   -- Even
(47),   -- Odd
(50),   -- Even
(53),   -- Odd
(56),   -- Even
(59),   -- Odd
(62);   -- Even


-- STEP 4: Use CASE to check Even / Odd
