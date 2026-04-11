CREATE database Employee;
USE Employee;

CREATE TABLE JobDepartment (
    Job_ID INT PRIMARY KEY,
    jobdept VARCHAR(50),
    name VARCHAR(100),
    description TEXT,
    salaryrange VARCHAR(50)
);

ALTER TABLE jobdepartment
CHANGE COLUMN Job_ID
JobID int;


-- For rest of the tables we imported it from csv files. 


--   1)EMPLOYEE INSIGHTS

# How many unique employees are currently in the system?
SELECT * FROM employee;
SELECT COUNT(*) AS 'total_employee'
FROM employee;

# Which departments have the highest number of employees?
SELECT jobdept, COUNT(JobID)
FROM jobdepartment
GROUP BY jobdept
ORDER BY COUNT(JobID) DESC
LIMIT 1;

# What is the average salary per department?
SELECT a.Jobdept,AVG(b.Amount) as 'average_salary'
FROM jobdepartment a 
JOIN salary_bonus b ON a.JobId =b.JobId
GROUP BY a.Jobdept;


#Who are the top 5 highest-paid employees?
SELECT e.FirstName, e.LastName, s.Amount
FROM employee e
JOIN salary_bonus s ON e.JobID = s.JobID
ORDER BY Amount DESC
LIMIT 5;

# What is the total salary expenditure across the company?
SELECT SUM(TotalAmount) as 'Total_Expenditure'
FROM payroll;



--    2).JOB ROLE AND DEPARTMENT ANALYSIS

# How many different job roles exist in each department?
SELECT jobdept, COUNT(name)
FROM jobdepartment
GROUP BY jobdept;

# What is the average salary range per department?
SELECT jobdept, AVG(Amount) as 'Average_Salary_Range'
FROM jobdepartment j
JOIN salary_bonus s ON j.JobID = s.JobID
GROUP BY jobdept;

#Which job roles offer the highest salary?
SELECT j.jobdept, MAX(s.Amount) as 'Highest_Salary'
FROM jobdepartment j
JOIN salary_bonus s ON j.JobID = s.JobID
GROUP BY jobdept
ORDER BY MAX(s.Amount) DESC;

# Which departments have the highest total salary allocation?
SELECT j.jobdept, SUM(s.Annual) as 'Highest_total_salary'
FROM jobdepartment j
JOIN salary_bonus s ON j.JobID = s.JobID
GROUP BY j.jobdept
ORDER BY SUM(s.Annual) DESC
LIMIT 1;



--  3).QUALIFICATION AND SKILLS ANALYSIS
SELECT * FROM employee;
SELECT * FROM qualification;

#How many employees have at least one qualification listed?
SELECT COUNT(Requirements) 'List_Of_Qualification'
FROM qualification
HAVING COUNT(Requirements) >= 1;

# Which positions require the most qualifications?
SELECT Position, COUNT(Requirements) as 'Most_Qualification' 
FROM qualification
GROUP BY Position 
ORDER BY 'Most_Qualifiaction'DESC
LIMIT 1;

# Which employees have the highest number of qualifications?
SELECT FirstName, COUNT(q.Requirements) as 'highest_Number_Of_Qualification'
FROM employee e
JOIN qualification q ON e.EmpID = q.EmpID
GROUP BY FirstName
ORDER BY highest_Number_Of_Qualification DESC
LIMIT 1;

SELECT EmpId , COUNT(Requirements) as 'qualifications'
FROM qualification
GROUP BY EmpId
ORDER BY qualifications DESC LIMIT 1;

SELECT * FROM employee;


--  4).LEAVE AND ABSENCE PATTERNS

# Which year had the most employees taking leaves?
SELECT MAX(extract(year from Date)) AS 'Most_leaves_in_Year' 
FROM leaves;

# What is the average number of leave days taken by its employees per department?
SELECT c.jobdept,AVG(a.LeaveId) as 'avgleaves'
FROM leaves a 
JOIN employee b ON a.EmpId= b.EmpId
JOIN jobdepartment c ON b.JobId = c.JobId
GROUP BY c.Jobdept;

# Which employees have taken the most leaves?
SELECT e.FirstName AS 'Names', COUNT(l.Date) AS Most_Leaves
FROM employee e
JOIN leaves l ON e.EmpID = l.EmpID
GROUP BY e.FirstName
ORDER BY Most_Leaves DESC;

SELECT a.FirstName , COUNT(b.Date) as cnt
FROM employee a 
JOIN leaves b ON a.EmpId = b.EmpId
GROUP BY a.FirstName
ORDER BY cnt DESC;

#What is the total number of leave days taken company-wide?
SELECT COUNT(Date) as 'Total_leave_taken'
FROM leaves;
SELECT * FROM leaves;
SELECT * FROM jobdepartment;

# How do leave days correlate with payroll amounts?
SELECT * FROM leaves;
SELECT * FROM payroll;
SELECT * FROM employee;

SELECT e.FirstName,e.LastName, COUNT(l.Date) as 'Number_of_Leaves', AVG(p.TotalAmount) as 'Avg_of_Payroll'
FROM employee e 
INNER JOIN leaves l ON e.EmpID = l.EmpID
INNER JOIN payroll p ON e.EmpID = p.EmpID
GROUP BY e.FirstName,e.LastName
ORDER BY Avg_of_Payroll;


--   5).PAYROLL AND COMPENSATION ANALYSIS

# What is the total monthly payroll processed?
SELECT Report, SUM(TotalAmount) as 'Total_Monthly_Payroll'
FROM payroll
GROUP BY Report;

# What is the average bonus given per department?
SELECT j.jobdept,AVG(s.Bonus) as 'Average_Bonus'
FROM jobdepartment j
JOIN salary_bonus s ON j.JobID = s.JobID
GROUP BY j.jobdept;

# Which department receives the highest total bonuses?
SELECT j.jobdept,SUM(s.Bonus) as 'Highest_Bonus'
FROM jobdepartment j
JOIN salary_bonus s ON j.JobID = s.JobID
GROUP BY j.jobdept
ORDER BY Highest_Bonus DESC
LIMIT 1;

# What is the average value of total_amount after considering leave deductions?
SELECT AVG(p.TotalAmount) as 'Leave_Deductions'
FROM leaves l
JOIN payroll p ON l.LeaveID = p.LeaveID;


--    6).EMPLOYEE PERFORMANCE AND GROWTH

#Which year had the highest number of employee promotions?
SELECT Position, SUM(extract(year from Date_In)) as 'Year_Of_Promotion'
FROM qualification
GROUP BY Position
ORDER BY Year_Of_Promotion DESC
LIMIT 1;


#To read all the records present in the table

SELECT * FROM employee;
SELECT * FROM jobdepartment;
SELECT * FROM leaves;
SELECT * FROM payroll;
SELECT * FROM qualification;
SELECT * FROM salary_bonus;