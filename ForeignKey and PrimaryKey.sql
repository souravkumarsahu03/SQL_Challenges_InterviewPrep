CREATE database sales;

USE sales;

CREATE table city(
city_id INT NOT NULL auto_increment,
city varchar(40),
PRIMARY KEY(city_id)
);

ALTER table city
RENAME COLUMN city TO
city_name;

INSERT INTO city (city_name) VALUES ('Mumbai'),
('Delhi'), ('Kolkata'), ('Telengana'), ('Bhubaneswar');

SELECT * FROM city;


#For foreign Key

CREATE table Customer(
customer_id INT NOT NULL,
first_name varchar(50),
last_name varchar(50),
city_name INT NOT NULL,
PRIMARY KEY(customer_id),
FOREIGN KEY(city_name) REFERENCES city(city_id)
);

SELECT * FROM Customer;

INSERT INTO Customer VALUES
(23, 'Sourav', 'Sahu', 5),
(28, 'Rahul', 'Sahu', 2),
(13, 'Raj', 'Kiran', 4),
(29, 'Kishan', 'Kumar', 1),
(43, 'Popi', 'Kanha', 3),
(27, 'Sahil', 'Khan', 5);