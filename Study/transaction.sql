-- Ʈ����� 
-- ��ܰ�� ������ sql���� ó���Ҷ�
-- �ӽ÷� ����� �����Ѵ�. �����ͺ��̽��� ������� �ʴ´�.
-- �߰��� ������ �߻��ϸ� �ѹ��Ͽ� �ӽ÷� ����� ����� �����.
-- �������� commit���� �ӽ÷� ����� ����� �����ͺ��̽��� ����ȴ�.


-- Ʈ����� ����
START TRANSACTION;

INSERT INTO orderList VALUES (4, NOW() , 1);
INSERT INTO orderItem VALUES (4, '0003', 1);
INSERT INTO orderItem VALUES (4, '0004', 2);


-- �� Ŀ��
COMMIT;
