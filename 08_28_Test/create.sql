DROP TABLE students;

CREATE TABLE students (

	s_id 			INT 		PRIMARY KEY 			AUTO_INCREMENT,
	s_name			CHAR(10)	NOT NULL,
	s_tel			CHAR(20)	NOT NULL,
	s_grade			INT			NOT NULL,
	s_class			CHAR(10)	NOT NULL
);

SELECT * FROM students WHERE s_name LIKE '%ja%';

INSERT INTO 
students (s_name, s_tel, s_grade, s_class) 
VALUES 
('j', '2660', 29, '501');


UPDATE students SET s_name = 'hi', s_tel = '202', s_grade = 1, s_class = '20' 
WHERE s_id = 1;


