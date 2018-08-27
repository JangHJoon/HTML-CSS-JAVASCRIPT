SELECT * FROM vendors;

SELECT * FROM products;

SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM orderItems;

-- 1. 제조업체(veder_id)가 “DLL01”이거나 “BRS01”인 제품의 이름(prod_name)과 가격(prod_price)을 가져오시오. 단 제품이름으로 오름차순(ASC) 정렬하시오.
-- products

SELECT p.prod_name, p.prod_price FROM vendors AS v, products AS p 
WHERE v.vend_id = p.vend_id AND v.vend_id IN ('DDL01', 'BRS01') 
ORDER BY p.prod_name;


-- 2. 가격(prod_price)이 5~10 인 제품의 가격과 이름(prod_name)을 가져오시오.
-- products

SELECT p.prod_price, p.prod_name FROM products AS p WHERE p.prod_price BETWEEN 5 AND 10;

-- 3. 가격(prod_price)이 입력되지 않은 제품의 이름(prod_name)을 가져오시오.
-- products

SELECT p.prod_name FROM products AS p WHERE p.prod_price = NULL;

-- 4. 제조 업체(vender_id)가 ‘DDL01’이 아닌 제품의 이름(prod_name)을 가져오시오. 단 이름으로 오름차순 정렬한다.
-- products

SELECT p.prod_name FROM products AS p, vendors AS v WHERE p.vend_id = v.vend_id AND v.vend_id <> 'DDL01' ORDER BY p.prod_name;

-- 5. 제품의 이름(prod_name)이 ‘Fish’로 시작하는 모든 제품의 아이디(prod_id)와 이름(prod_name)을 검색하시오.
-- products

SELECT p.prod_id, p.prod_name FROM products AS p WHERE p.prod_name LIKE 'Fish%';

-- 6. 제품의 이름(prod_name)이 ‘F’로 시작하고 ‘y’로 끝나는 제품의 이름(prod_name)을 검색하시오.
-- products

SELECT p.prod_name FROM products AS p WHERE p.prod_name LIKE 'F%y';

-- 7. 주문번호(order_num)가 20008인 품목의 아이디(prod_id)와 
-- 주문수량(quantity) 제품단가(item_price)와 총 주문 금액(quantity * item_price)를 출력하라. 
-- 단 총주문 금액은 expanded_price로 표기한다.
-- order_items

SELECT p.prod_id, o.quantity, o.item_price,  o.quantity*o.item_price AS expanded_price FROM products AS p, orderItems AS o
	WHERE p.prod_id = o.prod_id AND o.order_num = '20008';

-- 8. 가격(prod_price)이 4이상인 제품을 두 개 이상 가진 공급업체(vend_id)와 제품수량을 구하라.
-- products
-- GROUP BY 사용

SELECT v.vend_id, COUNT(*) FROM products AS p, vendors AS v 
WHERE v.vend_id = p.vend_id AND p.prod_price >= 4 GROUP BY v.vend_id HAVING COUNT(*) >= 2  ;



-- 9. ‘King doll’ 을 생산한 제조사의 이름과 주소를 구하라.

SELECT v.vend_name, v.vend_address FROM vendors AS v, products AS p WHERE p.prod_name = 'King doll';

-- 10. ‘RGAN01’ 물품을 주문한 모든 고객의 목록을 구하라.

SELECT c.cust_name FROM customers AS c, orders AS o, orderItems AS oi, products AS p 
WHERE c.cust_id = o.cust_id AND oi.order_num = o.order_num AND oi.prod_id = p.prod_id 
AND p.prod_id = 'RGAN01';




-- 11. 한번도 주문하지 않은 고객의 이름을 구하라.

SELECT DISTINCT c.cust_name FROM customers AS c WHERE c.cust_id NOT IN (SELECT DISTINCT o.cust_id FROM orders AS o);

-- 12. 제조사 이름(vend_name)이 ‘Bears R Us’ 인 제조사의 제품을 구매한 모든 고객의 이름(cust_name)을 구하시오. 단 중복은 제거한다.

SELECT DISTINCT c.cust_name FROM customers AS c, orders AS o, orderItems AS oi, products AS p, vendors AS v 
WHERE c.cust_id = o.cust_id AND oi.order_num = o.order_num AND oi.prod_id = p.prod_id AND p.vend_id = v.vend_id AND v.vend_name = 'Bears R Us';

-- 13. 가장 비싼 제품을 구매한 구매자의 이름 (cust_name) 과 판매가격(item_price), 구매수량(quantity)을 구하라.

SELECT c.cust_name, oi.item_price, oi.quantity FROM orderItems AS oi, orders AS o, customers AS c
WHERE oi.order_num = o.order_num AND o.cust_id = c.cust_id AND oi.item_price = (SELECT MAX(item_price) FROM orderItems);

-- 14. 제품을 하나도 생산하지 않은 제조사이름(vend_name)을 구하라.

SELECT v.vend_name FROM vendors AS v WHERE v.vend_id NOT IN (SELECT DISTINCT p.vend_id FROM products AS p);
