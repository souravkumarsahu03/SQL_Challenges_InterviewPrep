CREATE DATABASE const_prac;

USE const_prac;

CREATE TABLE emp_data(
emp_id INT  NOT NULL,
Name varchar(50),
email_id varchar(50) UNIQUE,
Experience int PRIMARY KEY,
Gender ENUM('Male','Female','Others'),
Team varchar(25) DEFAULT 'Technical'
);

INSERT INTO emp_data (emp_id,Name, email_id, Experience, Gender
) VALUES(101,'Sourav','souravkumarsahu03@gmail.com',5,'Male');
INSERT INTO emp_data (emp_id,Name, email_id, Experience, Gender
) VALUES(102,'Rahul','Rahulkumarsahu0@gmail.com',2,'Male');
INSERT INTO emp_data (emp_id,Name, email_id, Experience, Gender
) VALUES(103,'Sakshui','sak022@gmail.com',1,'Female');

SELECT * FROM emp_data;


CREATE TABLE emp_sal(
Experience int PRIMARY KEY,
salary int,
FOREIGN KEY (Experience) REFERENCES emp_data(Experience)
);

INSERT INTO emp_sal (Experience,salary)VALUES(1,23000);
INSERT INTO emp_sal (Experience,salary)VALUES(2,33000);
INSERT INTO emp_sal (Experience,salary)VALUES(4,43000); 
INSERT INTO emp_sal (Experience,salary)VALUES(5,73000);


SELECT * FROM emp_sal;