CREATE DATABASE auto_inc;

USE auto_inc;

CREATE table data1(
id INT AUTO_INCREMENT,
name varchar(30),
PRIMARY KEY(id)
);

INSERT INTO data1 (name) VALUES ('Ram');
INSERT INTO data1 (name) VALUES ('Shyam');
INSERT INTO data1 (name) VALUES ('Sourav');
INSERT INTO data1 (name) VALUES ('Kamal');

SELECT * FROM data1;