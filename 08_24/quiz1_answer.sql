SELECT * FROM customers;

SELECT * FROM job_list;

SELECT * FROM order_list;

SELECT * FROM products;


-- 1. �λ꿡 ��� ���� ������ ���϶�
SELECT job FROM job_list WHERE j_id = ANY (SELECT j_id FROM customers WHERE c_addr = 'pusan');

-- 2. �̸��� kim�� ����� ������?
SELECT job FROM job_list WHERE j_id = ANY (SELECT j_id FROM customers WHERE c_name = 'kim');

-- 3. ���� ������ �� ��ǰ�� ��ǰ����?
SELECT p_name FROM products WHERE p_price = (SELECT MIN(p_price) FROM products);

-- 4. ���� ������ ��ǰ�� �̸�,����, �������ڸ� ���Ͻÿ�. ��, �ֽ� ���ż����� �����Ѵ�.
SELECT o.c_id, p.p_name, o.o_count, o.o_date FROM order_list AS o, products AS p WHERE p.p_id = o.p_id ORDER BY o.c_id, o.o_date DESC;



-- 5. ���� ��� ��ǰ�� ������ ���� �̸������Ͻÿ�.
SELECT DISTINCT c.c_name FROM customers AS c, order_list AS o, products AS p WHERE c.c_id = o.c_id AND o.p_id = p.p_id AND p.p_price = (SELECT MAX(p_price) FROM products);


-- 6. DVD�� TV�� ������ ���� �̸��� �ּ�,��ǰ���� ���Ͻÿ�.
SELECT DISTINCT c.c_name, c.c_addr, p.p_name FROM customers AS c, order_list AS o, products AS p WHERE c.c_id = o.c_id AND o.p_id = p.p_id AND (p.p_name = 'DVD' OR p.p_name = 'TV');  

-- 7. doo�� ������ ������ �Ѿ��� ���Ͻÿ�.
SELECT SUM(p.p_price*o.o_count) FROM customers AS c, order_list AS o, products AS p 
WHERE c.c_id = o.c_id AND o.p_id = p.p_id GROUP BY c.c_name HAVING c.c_name = 'doo';

-- 8. ������ teacher�� ����� ������ ��ǰ����� ���Ͻÿ�.
SELECT DISTINCT p.p_name FROM job_list AS j, customers AS c, order_list AS o, products AS p WHERE c.c_id = o.c_id AND o.p_id = p.p_id AND c.j_id = j.j_id AND j.job = 'teacher';

-- 9. ������ student�� ���� �̸��� �����Ѿ��� ���Ͻÿ�.
SELECT c.c_name, sum(p.p_price*o.o_count) FROM job_list AS j, customers AS c, order_list AS o, products AS p WHERE c.c_id = o.c_id AND o.p_id = p.p_id AND c.j_id = j.j_id AND j.job = 'student' GROUP BY c.c_name;

-- 10. �ѹ��� �������� ���� ����� ������ ���Ͻÿ�.
SELECT DISTINCT job FROM job_list WHERE j_id = ANY(SELECT DISTINCT j_id FROM customers WHERE c_id NOT IN (SELECT DISTINCT c_id FROM order_list));
