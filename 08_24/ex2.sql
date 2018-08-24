CREATE TABLE emp (
	e_id 		INT 		PRIMARY KEY 			AUTO_INCREMENT,
	e_name		VARCHAR(10)	NOT NULL,
	e_manager 	INT
);


INSERT INTO emp (e_name, e_manager)
	VALUES
	('a', 2),
	('b', 3),
	('c', 4),
	('d', NULL);
	
SELECT * FROM emp;

-- SELF JOIN
-- 물리적으로 1개의 테이블을 논리적으로 2개로 분할하여 조인
-- 같은 테이블 내에서 참조가 일어나는 조인
SELECT e1.e_name AS empName, e2.e_name AS empManager FROM emp AS e1 INNER JOIN emp AS e2 ON e1.e_manager = e2.e_id;


-- outer join(left outer join, right outer join, full outer join)
-- MYSQL 에서는 FULL OUTHER JOIN을 지원 하지 않는다.
-- 조건에 안 맞는 값들도 고려할 것인가? 방식에 따라 3가지
SELECT e1.e_name AS empName, e2.e_name AS empManager FROM emp AS e1 LEFT OUTER JOIN emp AS e2 ON e1.e_manager = e2.e_id;



