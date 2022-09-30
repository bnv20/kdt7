--DML
SELECT * FROM book;
SELECT bookname, price FROM book;
SELECT publisher FROM book;
SELECT DISTINCT publisher FROM book;

SELECT * FROM book
WHERE price < 10000;

--Q. ������ 10000�� �̻� 20000�� ������ ���� �˻�
SELECT * FROM book 
WHERE price >= 10000 and price <= 20000;

SELECT * FROM book 
WHERE price BETWEEN 10000 and 20000;

--Q. ���ǻ簡 �½����� Ȥ�� ���ѹ̵���� ������ �˻�
SELECT * FROM book 
WHERE publisher = '�½�����' or publisher = '���� �̵��';

SELECT * FROM book 
WHERE publisher IN('�½�����','���� �̵��');

--Q. ���ǻ簡 �½����� Ȥ�� ���ѹ̵� �ƴ� ������ �˻�
SELECT * FROM book 
WHERE publisher NOT IN('�½�����','���ѹ̵��');

SELECT * FROM book 
WHERE bookname LIKE '�౸�� ����';

--Q. �����̸��� �౸�� ���Ե� ���ǻ縦 �˻�
SELECT bookname, publisher FROM book 
WHERE bookname LIKE '%�౸%';

--Q. �����̸��� ���� �� ��° ��ġ�� '��'��� ���ڿ��� ���� ���� �˻�
SELECT bookname, publisher FROM book 
WHERE bookname LIKE '_��%';

--Q. �౸�� ���� ���� �� ������ 20,000�� �̻��� ���� �˻�
SELECT * FROM book 
WHERE bookname LIKE '%�౸%' and price >= 20000;

SELECT * FROM book
ORDER BY bookname;

--Q ������������ ����
SELECT * FROM book
ORDER BY bookname DESC;

--Q. ������ ���ݼ����� �˻��ϰ� ������ ������ �̸������� �˻�
SELECT * FROM book
ORDER BY price, bookname;

--Q. ������ ������ ������������ �˻��ϼ���. ���� ������ ���ٸ� ���ǻ��� ������������ ���
SELECT * FROM book 
ORDER BY price DESC, publisher ASC;

SELECT * FROM orders;
SELECT SUM(saleprice)
FROM orders;

--Q. 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�
SELECT SUM(saleprice) AS "�� �Ǹž�" FROM orders 
WHERE CUSTID=2;

--Q. saleprice�� �հ�(TOTAL), ���(AVG), �ּҰ�(MIN), �ִ밪(MAX)�� ���
SELECT SUM(saleprice) as "TOTAL", 
AVG(saleprice) as AVG, MIN(saleprice) as MIN, 
MAX(saleprice) as MAX 
FROM orders;

SELECT COUNT(*)
FROM orders;

SELECT custid, COUNT(*) AS ��������, SUM(saleprice) AS "�� �Ǹž�"
FROM orders
GROUP BY custid;

--[����_0930_1] ������ 8000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���ϼ���.
-- ��, �α� �̻� ������ ���� ���ϼ���.

SELECT * FROM customer;
SELECT * FROM orders;

SELECT *
FROM customer, orders
WHERE customer.custid=orders.custid;

--Q. ���� ���� �ֹ��� ���� �����͸� ������ �����Ͽ� ���
SELECT *
FROM customer, orders
WHERE customer.custid=orders.custid ORDER BY customer.custid;

--Q. ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻�
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid=orders.custid;

--Q. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ� ������ ����
SELECT customer.name, SUM(orders.saleprice) 
FROM  customer, orders 
WHERE customer.custid = orders.custid 
GROUP BY customer.name 
ORDER BY customer.name;

--Q. ���� �̸��� ���� �ֹ��� ������ �̸��� ���ϼ���
SELECT C.name, B.bookname
FROM customer C, orders O, book B
WHERE C.custid=O.custid AND O.bookid=B.bookid;

--Q. ������ 20000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���ϼ���.
select customer.name, book.bookname
from customer, orders, book
where customer.custid = orders.custid 
and orders.bookid = book.bookid and book.price = 20000;

--Q. ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���ϼ���.
SELECT customer.name, orders.saleprice as �ǸŰ��� 
FROM customer LEFT OUTER JOIN orders on customer.custid=orders.custid;

SELECT C.name, O.saleprice
FROM customer C, orders O
WHERE C.custid = O.custid(+);

SELECT * FROM book;
--Q. ���� ��� ������ �̸��� ���
SELECT bookname
FROM book
WHERE price = (SELECT MAX(price) FROM book);

--[����_0930_2] ������ ������ ���� �ִ� ���� �̸��� �˻�

--[����_0930_3] ���� �̵��� ������ ������ ������ ���� �̸��� ���

--[����_0930_4] ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���

--[����_0930_5] ������ �ֹ����� ���� ���� �̸��� ���

--[����_0930_6] �ֹ��� �ִ� ���� �̸��� �ּҸ� ���

--DDL
CREATE TABLE newbook(
bookid      NUMBER,
bookname    VARCHAR2(20) NOT NULL,
publisher   VARCHAR2(20) UNIQUE,
price       NUMBER DEFAULT 10000 CHECK(price>1000),
PRIMARY KEY (bookid));

DESC newbook;

DROP TABLE newbook;
