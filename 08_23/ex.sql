/*
 * ���ڿ� : 'abc'
 * CHAR(10)	   -- �����̵�    -> 'abc' + 7byte
 * VARCHAR(10) -- �����̵� 	-> 'abc' 
 * TEXT
 * 
 * ���� ���� 		 => VARCHAR ex) ����� ���̵�
 * ���� �����ϴ� �� => CHAR 	ex) ����� ��й�ȣ
 * 
 * 
 * 
 * �Ǽ�
 * DECIMAL(��ü�ڸ���, �Ҽ��ڸ���)
 * 
 * DECIMAL(5, 2) : 100.25 , 100.255 -> 100.26
 * ������ ������ ����, �Ҽ��� �ڸ��� ������ �ݿø�
 * 
 */

-- ���̺� ����
DROP TABLE products;

-- ���̺� ����
-- �ΰ� ���� : INT(3) ZEROFILL, DEFAULT 'anonymous', CREATE TABLE IF NOT EXISTS produnts
CREATE TABLE products(	
	p_id		INT			PRIMARY KEY		AUTO_INCREMENT,  
	p_name		VARCHAR(20) NOT NULL,
	p_company   VARCHAR(20) NOT NULL,  
	p_price		INT			NOT NULL
);

-- ���̺� ��Ű�� Ȯ��
DESC products;

-- create : INSERT 
INSERT INTO products (p_name, p_company, p_price) 
	VALUES ('pen', 'monami', 200);
	
INSERT INTO products VALUES ('pen', 'monami', 200);

INSERT INTO products (p_price, p_company, p_name) 
	VALUES (10000, 'samsung', 'phone');
	
INSERT INTO products (p_price, p_company, p_name) 
	VALUES (20000, 'banana', 'phone');

INSERT INTO products (p_name, p_company, p_price)
	VALUES
	('car', 'bmwu', 30000),
	('boat', 'daisou', 20000);

-- Read : SELECT	
	
SELECT * FROM products;
SELECT p_name, p_price FROM products;


-- ������ 10000�� ������ ��ǰ�� �̸��� �����縦 ��������
SELECT p_name, p_company FROM products WHERE p_price <= 10000;

-- ������ 10000�� �̻� 20000�� ������ ��ǰ�� ��� ������ ���϶�.
SELECT * FROM products WHERE p_price >= 10000 AND p_price <= 20000;

-- id�� 2�� 4 ������ ��ǰ ��������
SELECT * FROM products WHERE p_id BETWEEN 2 AND 4;

-- 30000�� ¥�� ��ǰ�� �̸�
SELECT p_name FROM products WHERE p_price = 30000;

-- 30000���� �ƴ� ��ǰ�� �̸�
SELECT p_name FROM products WHERE p_price <> 30000;
SELECT p_name FROM products WHERE NOT p_price = 30000; 

-- ��ǰ ���̵� 1,2,3�� ��ǰ������?
SELECT p_price FROM products WHERE p_id = 1 OR p_id = 2 OR p_id = 3;
SELECT p_price FROM products WHERE p_id IN (1, 2, 3);


-- ������ ������������ ����
SELECT * FROM products ORDER BY p_price;
SELECT * FROM products ORDER BY p_price ASC;

-- ������ ������������ ����
SELECT * FROM products ORDER BY p_price DESC;

-- ������ ������������ ����, ������ ���� ��� ��ǰ �̸��� ������������ ����
SELECT * FROM products ORDER BY p_price, p_name DESC;

-- MYSQL���� ����(LIMIT) ������ �����Ѱ� ���� 3�� ��������
SELECT * FROM products ORDER BY p_price LIMIT 3;

-- ������ ������������ ���� �ѵ�, index 3���� 2�� ��������
SELECT * FROM products ORDER BY p_price LIMIT 3, 2;


-- ����

-- delete all record
DELETE FROM products;

-- delete
DELETE FROM products WHERE p_id = 2;

-- update 
-- ��ǰ��ȣ�� 1���� ������ 5000������ ��ǰ�̸��� ballpen���� ����
UPDATE products SET p_price = 5000 , p_name = 'ballpen' WHERE p_id = 1;




-- null �� ã��
CREATE TABLE dummy (
	value_a INT,
	value_b INT
);

INSERT INTO dummy (value_a) VALUE (2);
INSERT INTO dummy (value_a, value_b) VALUE (3,4);
INSERT INTO dummy (value_a, value_b) VALUE (4,5);

SELECT value_a FROM dummy WHERE value_b IS NULL;
SELECT value_a FROM dummy WHERE value_b IS NOT NULL;