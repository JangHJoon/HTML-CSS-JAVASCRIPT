
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
	



-- 1. 나이가 20살 이상 30살 이하인 학생의 이름과 나이, 학번을 구하라
-- MYSQL에서는 AS를 생략 가능
SELECT s_name AS name , s_age AS age, s_id AS id FROM students WHERE s_age BETWEEN 20 AND 30;

-- 2. 학생테이블의 데이터를 나이기준으로 오름차순 정렬하라, 단 나이가 같은 경우 이름으로 내림차순 정렬한다.
SELECT * FROM students ORDER BY s_age, s_name DESC;

-- 3. 나이가 학급에서 3번째로 낮은 사람의 이름과 나이를 구하라
SELECT s_name, s_age FROM students WHERE s_age = (SELECT DISTINCT s_age FROM students ORDER BY s_age LIMIT 2, 1);

-- 4. 이름이 peter인 학생의 나이를 21살로 변경하세요
SELECT * FROM students WHERE s_name = 'peter';
UPDATE students SET s_age = 21 WHERE s_name = 'peter';

SELECT * FROM students;


/*
 * 그룹함수(count, sum, avg, max, min) 
 * 
 * 그룹함수를 사용할 때 NULL값이 존재하면 연산에서 제외가 된다.
 * 
 * WHERE절과 같이 사용하지 않는다.(레코드 한줄 한줄 마다 처리함)
 * 대신 GROUP BY와 HAVING 으로 조건 처리 한다. 
 * 
 * 
 * 연산이 수행되는 순서
 * FROM -> WHERE(각 행에 조건 체크) -> GROUP BY -> HAVING(그룹들 조건 체크) -> ORDER BY -> SELECT 
 * 
 * 
 * 
 */

-- 5. 학생들의 나이의 총합은?
SELECT SUM(s_age) AS total_age FROM students;

-- 6. 전체 학생 수는?
-- count(*)인 경우 NULL이 존재하더라도 연산에서 제외가 되지 않는다.
SELECT COUNT(*) AS total_num FROM students;

-- 7. 평균 구하기?
SELECT AVG(s_age) AS avg_age FROM students;

-- 8. 최대값, 최소값
SELECT MAX(s_age) AS max_age FROM students;
SELECT MIN(s_age) AS min_age FROM students;


-- 9. 남학생과 여학생 수를 구하라.
SELECT s_gender, COUNT(*) FROM students GROUP BY s_gender;

-- 단, 구성원 수가 4명 이상인 그룹만 표기한다.
SELECT s_gender, COUNT(*) FROM students GROUP BY s_gender HAVING COUNT(*) >=4 ;


-- 10. jason의 담당교수 이름
-- sub-query : SQL내부에 존재하는 SQL문 질의 문의 결과가 1행 1열로 표현 되는 경우 -> 스칼라 값
SELECT p_name FROM professors WHERE p_id = (SELECT p_id FROM students WHERE s_name = 'jason');

-- join 사용(INNER JOIN , OUTER JOIN, SELF JOIN, CROSS JOIN)
  
-- CROSS JOIN 
SELECT s.s_name, p.p_name FROM students AS s, professors AS p 
SELECT * FROM students AS s INNER JOIN professors AS p

-- INNER JOIN 
SELECT s.s_name, p.p_name FROM students AS s, professors AS p 
WHERE s.p_id = p.p_id and s.s_name = 'jason'; 

SELECT * FROM students AS s INNER JOIN professors AS p 
ON s.p_id = p.p_id;
SELECT s.s_id , s.s_name, s.s_age, p.p_name FROM students AS s INNER JOIN professors AS p ON s.p_id = p.p_id;

-- 다른 방식 NATURAL JOIN (열 이름이 같은 것이 존재할 때 자동으로 JOIN)
SELECT * FROM students NATURAL JOIN professors WHERE s_name = 'jason'; 


-- 11. hulk 교슈가 담당하는 학생의 이름과 나이, 학번을 구하라
SELECT s.s_name, s.s_age , s.s_id FROM students AS s WHERE s.p_id = (SELECT p.p_id FROM professors AS p WHERE p.p_name='hulk');
SELECT .s_name, s.s_age, s.s_id FROM students AS s INNER JOIN professors AS p ON p WHERE p.p_name = 'hulk';



