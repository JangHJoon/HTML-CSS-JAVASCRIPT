SELECT * FROM vendors;

SELECT * FROM products;

SELECT * FROM customers;

SELECT * FROM orders;

SELECT * FROM orderItems;

-- 1. ������ü(veder_id)�� ��DLL01���̰ų� ��BRS01���� ��ǰ�� �̸�(prod_name)�� ����(prod_price)�� �������ÿ�. �� ��ǰ�̸����� ��������(ASC) �����Ͻÿ�.
-- products

SELECT p.prod_name, p.prod_price FROM vendors AS v, products AS p 
WHERE v.vend_id = p.vend_id AND v.vend_id IN ('DDL01', 'BRS01') 
ORDER BY p.prod_name;


-- 2. ����(prod_price)�� 5~10 �� ��ǰ�� ���ݰ� �̸�(prod_name)�� �������ÿ�.
-- products

SELECT p.prod_price, p.prod_name FROM products AS p WHERE p.prod_price BETWEEN 5 AND 10;

-- 3. ����(prod_price)�� �Էµ��� ���� ��ǰ�� �̸�(prod_name)�� �������ÿ�.
-- products

SELECT p.prod_name FROM products AS p WHERE p.prod_price = NULL;

SELECT 
	prod_name
FROM 
	products
WHERE 
	prod_price IS NULL;

-- 4. ���� ��ü(vender_id)�� ��DDL01���� �ƴ� ��ǰ�� �̸�(prod_name)�� �������ÿ�. �� �̸����� �������� �����Ѵ�.
-- products

SELECT p.prod_name FROM products AS p, vendors AS v 
WHERE p.vend_id = v.vend_id AND v.vend_id <> 'DDL01' 
ORDER BY p.prod_name;

-- 5. ��ǰ�� �̸�(prod_name)�� ��Fish���� �����ϴ� ��� ��ǰ�� ���̵�(prod_id)�� �̸�(prod_name)�� �˻��Ͻÿ�.
-- products

SELECT p.prod_id, p.prod_name FROM products AS p WHERE p.prod_name LIKE 'Fish%';

-- 6. ��ǰ�� �̸�(prod_name)�� ��F���� �����ϰ� ��y���� ������ ��ǰ�� �̸�(prod_name)�� �˻��Ͻÿ�.
-- products

SELECT p.prod_name FROM products AS p WHERE p.prod_name LIKE 'F%y';

-- 7. �ֹ���ȣ(order_num)�� 20008�� ǰ���� ���̵�(prod_id)�� 
-- �ֹ�����(quantity) ��ǰ�ܰ�(item_price)�� �� �ֹ� �ݾ�(quantity * item_price)�� ����϶�. 
-- �� ���ֹ� �ݾ��� expanded_price�� ǥ���Ѵ�.
-- order_items

SELECT p.prod_id, o.quantity, o.item_price,  o.quantity*o.item_price AS expanded_price FROM products AS p, orderItems AS o
	WHERE p.prod_id = o.prod_id AND o.order_num = '20008';

-- 8. ����(prod_price)�� 4�̻��� ��ǰ�� �� �� �̻� ���� ���޾�ü(vend_id)�� ��ǰ������ ���϶�.
-- products
-- GROUP BY ���

SELECT v.vend_id, COUNT(*) FROM products AS p, vendors AS v 
WHERE v.vend_id = p.vend_id AND p.prod_price >= 4 GROUP BY v.vend_id HAVING COUNT(*) >= 2  ;



-- 9. ��King doll�� �� ������ �������� �̸��� �ּҸ� ���϶�.

SELECT v.vend_name, v.vend_address FROM vendors AS v, products AS p 
WHERE p.prod_name = 'King doll';

-- 10. ��RGAN01�� ��ǰ�� �ֹ��� ��� ���� ����� ���϶�.

SELECT c.cust_name FROM customers AS c, orders AS o, orderItems AS oi, products AS p 
WHERE c.cust_id = o.cust_id AND oi.order_num = o.order_num AND oi.prod_id = p.prod_id 
AND p.prod_id = 'RGAN01';




-- 11. �ѹ��� �ֹ����� ���� ���� �̸��� ���϶�.

SELECT DISTINCT c.cust_name FROM customers AS c 
WHERE c.cust_id NOT IN (
	SELECT DISTINCT o.cust_id FROM orders AS o
);


SELECT 
	customers.cust_name
FROM 
	customers 
	LEFT OUTER JOIN 
	orders
ON 
	customers.cust_id = orders.cust_id
WHERE 
	orders.order_num IS NULL;

-- 12. ������ �̸�(vend_name)�� ��Bears R Us�� �� �������� ��ǰ�� ������ ��� ���� �̸�(cust_name)�� ���Ͻÿ�. �� �ߺ��� �����Ѵ�.

SELECT DISTINCT c.cust_name FROM customers AS c, orders AS o, orderItems AS oi, products AS p, vendors AS v 
WHERE c.cust_id = o.cust_id AND oi.order_num = o.order_num AND oi.prod_id = p.prod_id AND p.vend_id = v.vend_id AND v.vend_name = 'Bears R Us';

-- 13. ���� ��� ��ǰ�� ������ �������� �̸� (cust_name) �� �ǸŰ���(item_price), ���ż���(quantity)�� ���϶�.

SELECT c.cust_name, oi.item_price, oi.quantity FROM orderItems AS oi, orders AS o, customers AS c
WHERE oi.order_num = o.order_num AND o.cust_id = c.cust_id AND oi.item_price = (
	SELECT MAX(item_price) FROM orderItems
);

-- 14. ��ǰ�� �ϳ��� �������� ���� �������̸�(vend_name)�� ���϶�.

SELECT v.vend_name FROM vendors AS v WHERE v.vend_id NOT IN (
	SELECT DISTINCT p.vend_id FROM products AS p
);

SELECT 
	vend_name 
FROM 
	vendors 
	LEFT OUTER JOIN 
	products 
ON 
	vendors.vend_id = products.vend_id
WHERE 
	prod_name IS NULL;
