-- 트랜잭션 
-- 몇단계로 나누어 sql문을 처리할때
-- 임시로 결과를 저장한다. 데이터베이스엔 적용되지 않는다.
-- 중간에 오류가 발생하면 롤백하여 임시로 저장된 결과를 지운다.
-- 마지막에 commit으로 임시로 저장된 결과를 데이터베이스에 적용된다.


-- 트랜잭션 시작
START TRANSACTION;

INSERT INTO orderList VALUES (4, NOW() , 1);
INSERT INTO orderItem VALUES (4, '0003', 1);
INSERT INTO orderItem VALUES (4, '0004', 2);


-- 끝 커밋
COMMIT;
