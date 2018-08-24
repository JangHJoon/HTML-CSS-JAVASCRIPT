
DROP TABLE students;
DROP TABLE professors;

CREATE TABLE professors (	
	p_id		INT 			PRIMARY KEY 	AUTO_INCREMENT,
	p_name		VARCHAR(10)		NOT NULL,
	p_age 		INT 			NOT NULL
);

DESC professors;

CREATE TABLE students (
	s_id 		INT 			PRIMARY KEY 	AUTO_INCREMENT,
	s_name		VARCHAR(10)		NOT NULL,
	s_age 		INT				NOT	NULL,
	s_gender	ENUM('F','M')	NOT NULL,
	p_id 		INT				NOT NULL,
	FOREIGN KEY(p_id) 	REFERENCES professors(p_id)
);

DESC students;

INSERT INTO professors (p_name, p_age) VALUES
	('hulk', 45),
	('ironman', 41),
	('tor', 1500);

SELECT * FROM professors;
	
INSERT INTO students (s_name, s_age, s_gender, p_id) VALUES 
	('smith', 20 ,'M', 1),
	('jason', 28 , 'M', 3),
	('peter', 22, 'M', 1),
	('jane', 20, 'F', 3),
	('lily', 18, 'F', 2),
	('ken', 31, 'M', 1),
	('july', 22, 'F', 2);
	
SELECT * FROM students;
	



-- 1. ���̰� 20�� �̻� 30�� ������ �л��� �̸��� ����, �й��� ���϶�
-- MYSQL������ AS�� ���� ����
SELECT s_name AS name , s_age AS age, s_id AS id FROM students WHERE s_age BETWEEN 20 AND 30;

-- 2. �л����̺��� �����͸� ���̱������� �������� �����϶�, �� ���̰� ���� ��� �̸����� �������� �����Ѵ�.
SELECT * FROM students ORDER BY s_age, s_name DESC;

-- 3. ���̰� �б޿��� 3��°�� ���� ����� �̸��� ���̸� ���϶�
SELECT s_name, s_age FROM students WHERE s_age = (SELECT DISTINCT s_age FROM students ORDER BY s_age LIMIT 2, 1);

-- 4. �̸��� peter�� �л��� ���̸� 21��� �����ϼ���
SELECT * FROM students WHERE s_name = 'peter';
UPDATE students SET s_age = 21 WHERE s_name = 'peter';

SELECT * FROM students;


/*
 * �׷��Լ�(count, sum, avg, max, min) 
 * 
 * �׷��Լ��� ����� �� NULL���� �����ϸ� ���꿡�� ���ܰ� �ȴ�.
 * 
 * WHERE���� ���� ������� �ʴ´�.(���ڵ� ���� ���� ���� ó����)
 * ��� GROUP BY�� HAVING ���� ���� ó�� �Ѵ�. 
 * 
 * 
 * ������ ����Ǵ� ����
 * FROM -> WHERE(�� �࿡ ���� üũ) -> GROUP BY -> HAVING(�׷�� ���� üũ) -> ORDER BY -> SELECT 
 * 
 * 
 * 
 */

-- 5. �л����� ������ ������?
SELECT SUM(s_age) AS total_age FROM students;

-- 6. ��ü �л� ����?
-- count(*)�� ��� NULL�� �����ϴ��� ���꿡�� ���ܰ� ���� �ʴ´�.
SELECT COUNT(*) AS total_num FROM students;

-- 7. ��� ���ϱ�?
SELECT AVG(s_age) AS avg_age FROM students;

-- 8. �ִ밪, �ּҰ�
SELECT MAX(s_age) AS max_age FROM students;
SELECT MIN(s_age) AS min_age FROM students;


-- 9. ���л��� ���л� ���� ���϶�.
SELECT s_gender, COUNT(*) FROM students GROUP BY s_gender;

-- ��, ������ ���� 4�� �̻��� �׷츸 ǥ���Ѵ�.
SELECT s_gender, COUNT(*) FROM students GROUP BY s_gender HAVING COUNT(*) >=4 ;


-- 10. jason�� ��米�� �̸�
-- sub-query : SQL���ο� �����ϴ� SQL�� ���� ���� ����� 1�� 1���� ǥ�� �Ǵ� ��� -> ��Į�� ��
SELECT p_name FROM professors WHERE p_id = (SELECT p_id FROM students WHERE s_name = 'jason');

-- join ���(INNER JOIN , OUTER JOIN, SELF JOIN, CROSS JOIN)
  
-- CROSS JOIN 
SELECT s.s_name, p.p_name FROM students AS s, professors AS p 
SELECT * FROM students AS s INNER JOIN professors AS p

-- INNER JOIN 
SELECT s.s_name, p.p_name FROM students AS s, professors AS p 
WHERE s.p_id = p.p_id and s.s_name = 'jason'; 

SELECT * FROM students AS s INNER JOIN professors AS p 
ON s.p_id = p.p_id;
SELECT s.s_id , s.s_name, s.s_age, p.p_name FROM students AS s INNER JOIN professors AS p ON s.p_id = p.p_id;

-- �ٸ� ��� NATURAL JOIN (�� �̸��� ���� ���� ������ �� �ڵ����� JOIN)
SELECT * FROM students NATURAL JOIN professors WHERE s_name = 'jason'; 


-- 11. hulk ������ ����ϴ� �л��� �̸��� ����, �й��� ���϶�
SELECT s.s_name, s.s_age , s.s_id FROM students AS s WHERE s.p_id = (SELECT p.p_id FROM professors AS p WHERE p.p_name='hulk');
SELECT .s_name, s.s_age, s.s_id FROM students AS s INNER JOIN professors AS p ON p WHERE p.p_name = 'hulk';



