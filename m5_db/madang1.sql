--DML
SELECT * FROM book;
SELECT bookname, price FROM book;
SELECT publisher FROM book;
SELECT DISTINCT publisher FROM book;

SELECT * FROM book
WHERE price < 10000;

--Q. 가격이 10000원 이상 20000원 이하인 도서 검색
SELECT * FROM book 
WHERE price >= 10000 and price <= 20000;

SELECT * FROM book 
WHERE price BETWEEN 10000 and 20000;

--Q. 출판사가 굿스포츠 혹은 대한미디어인 도서를 검색
SELECT * FROM book 
WHERE publisher = '굿스포츠' or publisher = '대한 미디어';

SELECT * FROM book 
WHERE publisher IN('굿스포츠','대한 미디어');

--Q. 출판사가 굿스포츠 혹은 대한미디어가 아닌 도서를 검색
SELECT * FROM book 
WHERE publisher NOT IN('굿스포츠','대한미디어');

SELECT * FROM book 
WHERE bookname LIKE '축구의 역사';

--Q. 도서이름에 축구가 포함된 출판사를 검색
SELECT bookname, publisher FROM book 
WHERE bookname LIKE '%축구%';

--Q. 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서 검색
SELECT bookname, publisher FROM book 
WHERE bookname LIKE '_구%';

--Q. 축구에 관한 도서 중 가격이 20,000원 이상인 도서 검색
SELECT * FROM book 
WHERE bookname LIKE '%축구%' and price >= 20000;

SELECT * FROM book
ORDER BY bookname;

--Q 내림차순으로 정렬
SELECT * FROM book
ORDER BY bookname DESC;

--Q. 도서를 가격순으로 검색하고 가격이 같으면 이름순으로 검색
SELECT * FROM book
ORDER BY price, bookname;

--Q. 도서를 가격의 내림차순으로 검색하세요. 만약 가격이 같다면 출판사의 오름차순으로 출력
SELECT * FROM book 
ORDER BY price DESC, publisher ASC;

SELECT * FROM orders;
SELECT SUM(saleprice)
FROM orders;

--Q. 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오
SELECT SUM(saleprice) AS "총 판매액" FROM orders 
WHERE CUSTID=2;

--Q. saleprice의 합계(TOTAL), 평균(AVG), 최소값(MIN), 최대값(MAX)로 출력
SELECT SUM(saleprice) as "TOTAL", 
AVG(saleprice) as AVG, MIN(saleprice) as MIN, 
MAX(saleprice) as MAX 
FROM orders;

SELECT COUNT(*)
FROM orders;

SELECT custid, COUNT(*) AS 도서수량, SUM(saleprice) AS "총 판매액"
FROM orders
GROUP BY custid;

--[과제_0930_1] 가격이 8000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하세요.
-- 단, 두권 이상 구매한 고객만 구하세요.

SELECT * FROM customer;
SELECT * FROM orders;

SELECT *
FROM customer, orders
WHERE customer.custid=orders.custid;

--Q. 고객과 고객의 주문에 관한 데이터를 고객별로 정렬하여 출력
SELECT *
FROM customer, orders
WHERE customer.custid=orders.custid ORDER BY customer.custid;

--Q. 고객의 이름과 고객이 주문한 도서의 판매가격을 검색
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid=orders.custid;

--Q. 고객별로 주문한 모든 도서의 총 판매액을 구하고 고객별로 정렬
SELECT customer.name, SUM(orders.saleprice) 
FROM  customer, orders 
WHERE customer.custid = orders.custid 
GROUP BY customer.name 
ORDER BY customer.name;

--Q. 고객의 이름과 고객이 주문한 도서의 이름을 구하세요
SELECT C.name, B.bookname
FROM customer C, orders O, book B
WHERE C.custid=O.custid AND O.bookid=B.bookid;

--Q. 가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하세요.
select customer.name, book.bookname
from customer, orders, book
where customer.custid = orders.custid 
and orders.bookid = book.bookid and book.price = 20000;

--Q. 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하세요.
SELECT customer.name, orders.saleprice as 판매가격 
FROM customer LEFT OUTER JOIN orders on customer.custid=orders.custid;

SELECT C.name, O.saleprice
FROM customer C, orders O
WHERE C.custid = O.custid(+);

SELECT * FROM book;
--Q. 가장 비싼 도서의 이름을 출력
SELECT bookname
FROM book
WHERE price = (SELECT MAX(price) FROM book);

--[과제_0930_2] 도서를 구매한 적인 있는 고객의 이름을 검색

--[과제_0930_3] 대한 미디어에서 출판한 도서를 구매한 고객의 이름을 출력

--[과제_0930_4] 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 출력

--[과제_0930_5] 도서를 주문하지 않은 고객의 이름을 출력

--[과제_0930_6] 주문이 있는 고객의 이름과 주소를 출력

--DDL
CREATE TABLE newbook(
bookid      NUMBER,
bookname    VARCHAR2(20) NOT NULL,
publisher   VARCHAR2(20) UNIQUE,
price       NUMBER DEFAULT 10000 CHECK(price>1000),
PRIMARY KEY (bookid));

DESC newbook;

DROP TABLE newbook;

CREATE TABLE newcustomer(
custid NUMBER PRIMARY KEY,
name VARCHAR2(40),
address VARCHAR2(40),
phone VARCHAR2(30));

DESC newcustomer;
DESC orders;
CREATE TABLE neworders(
orderid NUMBER,
custid NUMBER NOT NULL,
bookid NUMBER NOT NULL,
saleprice NUMBER,
orderdate DATE,
PRIMARY KEY(orderid),
FOREIGN KEY(custid) REFERENCES newcustomer(custid) ON DELETE CASCADE);

DESC neworders;

CREATE TABLE newbook(
bookid NUMBER PRIMARY KEY,
bookname VARCHAR2(20) NOT NULL,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 CHECK(price>1000));

DESC newbook;
ALTER TABLE newbook ADD isbn VARCHAR2(15);

--과제_1024_1. newbook 테이블의 isbn 속성을 삭제하세요.
--과제_1024_2. newbook 테이블의 기본키를 삭제한 후 다시 bookid 속성을 기본키로 변경하세요.
--과제_1024_3. newbook 테이블을 삭제하세요.

SELECT * FROM customer;
--Q. CUSTOMER 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경.
UPDATE customer
SET address = '대한민국 부산'
WHERE custid =5;

--Q. CUSTOMER 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경
update customer
set address = (select address from customer where name = '김연아')
where custid = 5;

--Q. CUSTOMER 테이블에서 고객번호가 5인 고객을 삭제한 후 결과를 확인
DELETE customer
WHERE custid = 5;