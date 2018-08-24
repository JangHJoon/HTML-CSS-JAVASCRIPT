SELECT * FROM customers;

SELECT * FROM job_list;

SELECT * FROM order_list;

SELECT * FROM products;


-- 1. 부산에 사는 고객의 직업을 구하라
SELECT job FROM job_list WHERE j_id = ANY (SELECT j_id FROM customers WHERE c_addr = 'pusan');

-- 2. 이름이 kim인 사람의 직업은?
SELECT job FROM job_list WHERE j_id = ANY (SELECT j_id FROM customers WHERE c_name = 'kim');

-- 3. 가장 가격이 싼 제품의 제품명은?
SELECT p_name FROM products WHERE p_price = (SELECT MIN(p_price) FROM products);

-- 4. 고객별 구매한 제품의 이름,수량, 구매일자를 구하시오. 단, 최신 구매순으로 정렬한다.
SELECT o.c_id, p.p_name, o.o_count, o.o_date FROM order_list AS o, products AS p WHERE p.p_id = o.p_id ORDER BY o.c_id, o.o_date DESC;



-- 5. 가장 비싼 제품을 구입한 고객의 이름을구하시오.
SELECT DISTINCT c.c_name FROM customers AS c, order_list AS o, products AS p WHERE c.c_id = o.c_id AND o.p_id = p.p_id AND p.p_price = (SELECT MAX(p_price) FROM products);


-- 6. DVD나 TV를 구매한 고객의 이름과 주소,제품명을 구하시오.
SELECT DISTINCT c.c_name, c.c_addr, p.p_name FROM customers AS c, order_list AS o, products AS p WHERE c.c_id = o.c_id AND o.p_id = p.p_id AND (p.p_name = 'DVD' OR p.p_name = 'TV');  

-- 7. doo가 구매한 가격의 총액을 구하시오.
SELECT SUM(p.p_price*o.o_count) FROM customers AS c, order_list AS o, products AS p WHERE c.c_id = o.c_id AND o.p_id = p.p_id GROUP BY c.c_name HAVING c.c_name = 'doo';

-- 8. 직업이 teacher인 사람이 구매한 제품목록을 구하시오.
SELECT DISTINCT p.p_name FROM job_list AS j, customers AS c, order_list AS o, products AS p WHERE c.c_id = o.c_id AND o.p_id = p.p_id AND c.j_id = j.j_id AND j.job = 'teacher';

-- 9. 직업이 student인 고객의 이름과 구매총액을 구하시오.
SELECT c.c_name, sum(p.p_price*o.o_count) FROM job_list AS j, customers AS c, order_list AS o, products AS p WHERE c.c_id = o.c_id AND o.p_id = p.p_id AND c.j_id = j.j_id AND j.job = 'student' GROUP BY c.c_name;

-- 10. 한번도 구매하지 않은 사람의 직업을 구하시오.
SELECT DISTINCT job FROM job_list WHERE j_id = ANY(SELECT DISTINCT j_id FROM customers WHERE c_id NOT IN (SELECT DISTINCT c_id FROM order_list));
