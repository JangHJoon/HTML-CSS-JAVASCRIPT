-- alt + x : 선택 구문 실행
/*
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 */
-- 테이블 삭제
DROP TABLE test;
DROP TABLE mytable;


-- 테이블 만들기
CREATE TABLE mytable (
	test_id	int PRIMARY KEY,
	test_value char(10)
);

insert into mytable values(1,231)


select * from mytable