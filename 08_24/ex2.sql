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
-- ���������� 1���� ���̺��� �������� 2���� �����Ͽ� ����
-- ���� ���̺� ������ ������ �Ͼ�� ����
SELECT e1.e_name AS empName, e2.e_name AS empManager FROM emp AS e1 INNER JOIN emp AS e2 ON e1.e_manager = e2.e_id;


-- outer join(left outer join, right outer join, full outer join)
-- MYSQL ������ FULL OUTHER JOIN�� ���� ���� �ʴ´�.
-- ���ǿ� �� �´� ���鵵 ����� ���ΰ�? ��Ŀ� ���� 3����
SELECT e1.e_name AS empName, e2.e_name AS empManager FROM emp AS e1 LEFT OUTER JOIN emp AS e2 ON e1.e_manager = e2.e_id;



