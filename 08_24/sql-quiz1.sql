
-------------------------
-- Drop all tables
-------------------------
DROP TABLE products;
DROP TABLE order_list;
DROP TABLE customers;
DROP TABLE job_list;

-------------------------
-- Create products table
-------------------------
CREATE TABLE products (
	p_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	p_name VARCHAR(20) NOT NULL,
	p_price INT NOT NULL
);

-------------------------
-- Create customers table
-------------------------
CREATE TABLE customers (
	c_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	c_name VARCHAR(20) NOT NULL,
	c_addr VARCHAR(20) NOT NULL,
	j_id INT NOT NULL
);

-------------------------
-- Create order_list table
-------------------------
CREATE TABLE order_list (
	o_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	p_id INT NOT NULL,
	c_id INT NOT NULL,
	o_date DATE NOT NULL,
	o_count INT NOT NULL
);

-------------------------
-- Create job_list table
-------------------------
CREATE TABLE job_list(
	j_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	job VARCHAR(10) NOT NULL
);


---------------------------
-- Populate job_list table
---------------------------
INSERT INTO job_list (job) VALUES
	('student'),
	('teacher'),
	('programmer'),
	('guard');
	
---------------------------
-- Populate products table
---------------------------	
INSERT INTO products (p_name, p_price) VALUES
	('DVD', 250000),
	('TV', 150000),
	('audio', 900000),
	('computer', 750000);

---------------------------
-- Populate customers table
---------------------------
INSERT INTO customers (c_name, c_addr, j_id) VALUES 
	('doo', 'pusan', 2),
	('hong', 'seoul', 2),
	('kim', 'ursan', 1),
	('jack', 'pusan', 3),
	('smith', 'inchun', 4);

---------------------------
-- Populate order_list table
---------------------------
INSERT INTO order_list (p_id, c_id, o_date, o_count) VALUES
	(1, 1, '2014-12-13', 2),
	(4, 3, '2014-12-18', 1),
	(3, 2, '2015-12-24', 2),
	(1, 3, '2016-12-31', 3),
	(2, 4, '2012-12-31', 3),
	(3, 1, '2015-1-1', 1),
	(2, 3, '2016-1-1', 3),
	(4, 4, '2016-1-2', 3),
	(2, 1, '2015-1-3', 4),
	(3, 2, '2013-1-5', 1),
	(1, 2, '2016-1-5', 2);
