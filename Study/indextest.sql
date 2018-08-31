DROP TABLE sample;

CREATE TABLE sample (

	s_id 			INT 			AUTO_INCREMENT,
	s_cd			CHAR(10)		NOT NULL,
	s_bd			CHAR(10)		NOT NULL 		DEFAULT 'a',
	PRIMARY KEY(s_id)
);

DESC sample;


INSERT INTO 
	sample(s_cd, s_bd) 
VALUES
	('a', 'f'),
	('b', 'e'),
	('c', 'd'),
	('d', 'c'),
	('e', 'b'),
	('f', 'a');
	
SELECT * FROM sample;

DROP INDEX sample_idx ON sample;


-- ���̺� �� ��ü�� �ε��� ����
-- ���̺��� �����Ǹ� ���̺� �� �ε��� �ڵ� ����
-- �ε��� ���� WHERE ���� ������ �����ϸ� �˻� �ӵ� ���
CREATE INDEX sample_idx ON sample(s_bd);

-- �ε����� �˻������� Ȯ��
EXPLAIN SELECT * FROM sample WHERE s_bd = 'd';
EXPLAIN SELECT * FROM sample WHERE s_cd = 'd';











