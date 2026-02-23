CREATE DATABASE example;

USE example;

CREATE TABLE emp(
	id INT AUTO_INCREMENT PRIMARY KEY,
    names varchar(50)
);

INSERT INTO emp (names) VALUES ('SRV');
INSERT INTO emp (names) VALUES ('SRV1');
INSERT INTO emp (names) VALUES ('SRV2');

DELETE FROM emp
WHERE id = 5;

TRUNCATE table emp;

INSERT INTO emp (names) VALUES ('SRV3'); 
-- It will never forget the past records 
INSERT INTO emp (names) VALUES ('SRV6');

SELECT * FROM emp;