SELECT ABS(-78),ABS(+78)
FROM dual;

SELECT ROUND(4.875,1)
FROM dual;

SELECT * FROM orders;
--Q. ���̸��� ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���ϼ���.
SELECT * FROM orders;
SELECT C.name ,ROUND(avg(O.saleprice),-2)
FROM orders O,customer C
WHERE C.custid=O.custid
GROUP BY c.name;

SELECT * FROM book;
--Q. ���� ���� '�߱�'�� ���Ե� ������ '��'�� ������ �� �������, ������ ���
SELECT bookid, REPLACE(bookname,'�߱�','��') bookname, publisher, price
FROM book;

SELECT bookname ����, length(bookname) ���ڼ�, lengthb(bookname) AS ����Ʈ��
FROM book;
DESC customer;
SELECT * FROM customer;
INSERT INTO customer VALUES(5, '�ڼ���', '���ѹα� ����', NULL);

--����_1004_4. customer ���̺��� ���� ���� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���ϼ���.

SELECT * FROM orders;
--Q. �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���ϼ���.
SELECT orderid �ֹ���ȣ, orderdate �ֹ���, orderdate+10 Ȯ������
FROM orders;

--����_1004_5. 2020�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���(�� �ֹ����� '2020-07-07 ȭ����' ����)

SELECT SYSDATE FROM dual;
SELECT SYSDATE, TO_CHAR(SYSDATE, 'yyyy/mm/dd dy hh24:mi:ss') SYSDATE1
FROM dual;

SELECT * FROM customer;
--Q. �̸�, ��ȭ��ȣ�� ���Ե� ������� ���̼���. ��, ��ȭ��ȣ�� ���� ���� '����ó ����'���� ǥ���Ͽ� ���(NVL �Լ� ���)
SELECT name �̸�, NVL(phone, '����ó����') ��ȭ��ȣ
FROM customer;

--SELECT COALESCE(NULL,NULL,'third value','forth value'); ����° ���� Null�� �ƴ� ù��° ���̱� ������ ����° ���� ��ȯ
SELECT NAME �̸�, PHONE, COALESCE(PHONE,'����ó����') ��ȭ��ȣ
FROM customer;

SELECT ROWNUM ����, custid ����ȣ, name �̸�, phone ��ȭ��ȣ
FROM customer
WHERE ROWNUM <=3;

SELECT * FROM orders;
--Q. ��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���
SELECT orderid, saleprice FROM orders 
WHERE SALEPRICE < (SELECT AVG(SALEPRICE) FROM ORDERS o);

--Q. �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ� �ֹ���ȣ, ����ȣ, �ݾ��� ���
SELECT orderid, custid, saleprice
FROM orders o1
WHERE saleprice > (SELECT AVG(saleprice) FROM orders o2 
                    WHERE o1.custid = o2.custid );


--����_1004_5. ���ѹα��� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���

--����_1004_6. 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���

--����_1004_7. ����ȣ�� 2 ������ ���� �Ǹž��� ���(��, ���̸��� ���� �Ǹž� ����)

--����_1004_8. lmembers �����͸� ������ �Ӽ�(����,����,��������) �����հ�(�ݱ⺰), ��ձ���(�ݱ⺰), ���ź�(�ݱ⺰) �� ��� 