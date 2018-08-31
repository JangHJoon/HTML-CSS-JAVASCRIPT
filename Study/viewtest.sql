DROP TABLE sample;

CREATE TABLE sample (

	s_id 			INT 			AUTO_INCREMENT,
	s_cd			CHAR(10)		NOT NULL 		COMMENT 'ddd',
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


SELECT * FROM dummy
UNION

SELECT * FROM sample 
; 




