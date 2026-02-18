-- Create database
CREATE database explain_joins;
USE explain_joins;


-- Create first table: Students
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Insert data into students
INSERT INTO students (student_id, name) VALUES
(1, 'Ayesha'),
(2, 'Rahul'),
(3, 'Meera'),
(4, 'Karan');

SELECT * FROM students;

-- Create second table: Marks
CREATE TABLE marks (
    student_id INT,
    subject VARCHAR(50),
    marks INT
);

-- Insert data into marks
INSERT INTO marks (student_id, subject, marks) VALUES
(1, 'Math', 90),
(2, 'Science', 85),
(3, 'English', 70),
(5, 'History', 88);   -- Note: student_id 5 not in students


SELECT * FROM marks;


-- LEFT JOIN
-- Returns all rows from left table (students) + matching rows from right (marks).
SELECT * FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id;

-- RIGHT JOIN
-- Returns all rows from right table (marks) + matching rows from left (students).

SELECT * FROM students s
RIGHT JOIN marks m ON s.student_id = m.student_id;



-- INNER JOIN
-- Returns only matching rows from both tables.
SELECT * FROM students s
INNER JOIN marks m ON s.student_id = m.student_id;

-- Both are same

SELECT * FROM students s
JOIN marks m ON s.student_id = m.student_id;


-- FULL OUTER JOIN
-- Returns all rows from both tables (matches + non-matches).
-- MySQL does not support FULL OUTER JOIN directly.
-- But you can simulate it using UNION of LEFT JOIN + RIGHT JOIN.
SELECT * FROM students s
RIGHT JOIN marks m ON s.student_id = m.student_id
UNION
SELECT * FROM students s
LEFT JOIN marks m ON s.student_id = m.student_id;



-- LEFT EXCLUSIVE JOIN
-- Returns rows from the left table only which have no match in the right table.

SELECT s.student_id,s.name,m.subject,m.marks
FROM students as s
LEFT JOIN marks as m
ON s.student_id = m.student_id
WHERE m.student_id is NULL;




-- RIGHT EXCLUSIVE JOIN
-- Returns rows from the right table only which have no match in the left table.
SELECT s.student_id,s.name,m.subject,m.marks
FROM students as s
RIGHT JOIN marks as m
ON s.student_id = m.student_id
WHERE s.student_id is NULL;



-- FULL OUTER EXCLUSIVE JOIN
-- Returns rows that are exclusive to left OR right (non-matching rows from both).
-- Since MySQL doesn’t support FULL OUTER JOIN directly → use UNION.
SELECT s.student_id,s.name,m.subject,m.marks
FROM students as s
LEFT JOIN marks as m
ON s.student_id = m.student_id
WHERE m.student_id is NULL
UNION
SELECT s.student_id,s.name,m.subject,m.marks
FROM students as s
RIGHT JOIN marks as m
ON s.student_id = m.student_id
WHERE s.student_id is NULL;

-- Left exclusive


-- CROSS JOIN
-- Returns all possible combinations (Cartesian product).
SELECT s.student_id, s.name, m.subject,  m.marks
FROM students s
CROSS JOIN marks m ON s.student_id = m.student_id;

-- SELF JOIN
-- Join a table with itself (used for hierarchical data like employees & managers).


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees VALUES
(1, 'Ayesha', NULL),
(2, 'Rahul', 1),
(3, 'Meera', 1),
(4, 'Karan', 2);

SELECT marks,
CASE
	WHEN marks >= 85 THEN 'A+'
    WHEN marks < 90 THEN 'B'
END AS 'Marks_Grade' 
FROM marks;
