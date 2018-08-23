/*
 * 문자열 : 'abc'
 * CHAR(10)	   -- 수정이득    -> 'abc' + 7byte
 * VARCHAR(10) -- 공간이득 	-> 'abc' 
 * TEXT
 * 
 * 변경 못함 		 => VARCHAR ex) 사용자 아이디
 * 자주 변경하는 값 => CHAR 	ex) 사용자 비밀번호
 * 
 * 
 * 
 * 실수
 * DECIMAL(전체자리수, 소수자리수)
 * 
 * DECIMAL(5, 2) : 100.25 , 100.255 -> 100.26
 * 정수는 넘으면 에러, 소수는 자리수 넘으면 반올림
 * 
 */

-- 테이블 삭제
DROP TABLE products;

-- 테이블 생성
-- 부가 설정 : INT(3) ZEROFILL, DEFAULT 'anonymous', CREATE TABLE IF NOT EXISTS produnts
CREATE TABLE products(	
	p_id		INT			PRIMARY KEY		AUTO_INCREMENT,  
	p_name		VARCHAR(20) NOT NULL,
	p_company   VARCHAR(20) NOT NULL,  
	p_price		INT			NOT NULL
);

-- 테이블 스키마 확인
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


-- 가격이 10000원 이하인 제품의 이름과 제조사를 가져오기
SELECT p_name, p_company FROM products WHERE p_price <= 10000;

-- 가격이 10000원 이상 20000원 이하인 제품의 모든 정보를 구하라.
SELECT * FROM products WHERE p_price >= 10000 AND p_price <= 20000;

-- id가 2와 4 사이인 제품 가져오기
SELECT * FROM products WHERE p_id BETWEEN 2 AND 4;

-- 30000원 짜리 제품의 이름
SELECT p_name FROM products WHERE p_price = 30000;

-- 30000원이 아닌 제품의 이름
SELECT p_name FROM products WHERE p_price <> 30000;
SELECT p_name FROM products WHERE NOT p_price = 30000; 

-- 제품 아이디가 1,2,3인 제품가격은?
SELECT p_price FROM products WHERE p_id = 1 OR p_id = 2 OR p_id = 3;
SELECT p_price FROM products WHERE p_id IN (1, 2, 3);


-- 가격을 오름차순으로 정렬
SELECT * FROM products ORDER BY p_price;
SELECT * FROM products ORDER BY p_price ASC;

-- 가격을 내림차순으로 정렬
SELECT * FROM products ORDER BY p_price DESC;

-- 가격을 오름차순으로 정렬, 가격이 같은 경우 제품 이름을 내림차순으로 정렬
SELECT * FROM products ORDER BY p_price, p_name DESC;

-- MYSQL만의 문법(LIMIT) 가격이 저렴한거 상위 3개 가져오기
SELECT * FROM products ORDER BY p_price LIMIT 3;

-- 가격을 오름차순으로 정렬 한뒤, index 3부터 2개 가져오기
SELECT * FROM products ORDER BY p_price LIMIT 3, 2;


-- 주의

-- delete all record
DELETE FROM products;

-- delete
DELETE FROM products WHERE p_id = 2;

-- update 
-- 제품번호가 1번인 가격을 5000원으로 제품이름을 ballpen으로 수정
UPDATE products SET p_price = 5000 , p_name = 'ballpen' WHERE p_id = 1;




-- null 값 찾기
CREATE TABLE dummy (
	value_a INT,
	value_b INT
);

INSERT INTO dummy (value_a) VALUE (2);
INSERT INTO dummy (value_a, value_b) VALUE (3,4);
INSERT INTO dummy (value_a, value_b) VALUE (4,5);

SELECT value_a FROM dummy WHERE value_b IS NULL;
SELECT value_a FROM dummy WHERE value_b IS NOT NULL;