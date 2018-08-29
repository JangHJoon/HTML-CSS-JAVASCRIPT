DROP TABLE posts;

CREATE TABLE posts (

	p_id			INT 			PRIMARY KEY				AUTO_INCREMENT,
	p_ip			CHAR(20)		NOT NULL,
	p_password		VARCHAR(20)		NOT NULL,
	p_title			VARCHAR(100)	NOT NULL,
	p_content		TEXT			NOT NULL,
	p_date			DATETIME		NOT NULL

);

SELECT * FROM posts;

INSERT INTO posts (p_title,p_content, p_password, p_date, p_ip)
VALUE ('1','1','1',now(),'0:0:0:0:0:0:0:1');