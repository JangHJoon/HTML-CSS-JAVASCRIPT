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


-- 테이블 내 객체로 인덱스 생성
-- 테이블이 삭제되면 테이블 내 인덱스 자동 삭제
-- 인덱스 열을 WHERE 구로 조건을 지정하면 검색 속도 향상
CREATE INDEX sample_idx ON sample(s_bd);

-- 인덱스로 검색하지는 확인
EXPLAIN SELECT * FROM sample WHERE s_bd = 'd';
EXPLAIN SELECT * FROM sample WHERE s_cd = 'd';











