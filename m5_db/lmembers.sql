--lmembers
SELECT COUNT(*) FROM PURPRD;
SELECT SUM(PURAMT) FROM PURPRD;
SELECT AVG(PURAMT) FROM PURPRD;

--Q. lmembers purprd ���̺�� ���� �ѱ��ž�, 2014 ���ž�, 2015 ���ž��� �ѹ��� ���
select (select sum(p1.puramt) from purprd p1) as amt,
(select sum(p2.puramt) from purprd p2 where p2.purdate < 20150101) as amt_2014,
(select sum(p3.puramt) from purprd p3 where p3.purdate > 20141231) as amt_2015
from dual;

select sum(puramt) �ѱ��ž�, 
sum(case when purdate <= '20141231' then puramt end) "2014 ���ž�", 
sum(case when purdate > '20141231' and purdate <= '20151231' then puramt end) "2015 ���ž�"
from purprd;

--Q. lmembers �����Ϳ��� ���� ���űݾ��� �հ踦 ���� cuspur ���̺��� ������ �� demo ���̺�� ����ȣ(custno)�� �������� �����Ͽ� ���
CREATE TABLE cuspur
AS select custno, sum(puramt) puramt_sum
FROM purprd 
GROUP BY custno
ORDER BY custno;

SELECT D.*, C.puramt_sum 
FROM demo D, cuspur C
WHERE D.custno = C.custno
ORDER BY D.custno;


--[����_1006_1] purprd �����ͷ� ���� �Ʒ� ������ �����ϼ���.
--2�Ⱓ ���űݾ��� ���� ������ �и��Ͽ� ����, ���޻纰�� ���ž��� ǥ���ϴ� AMT_14, AMT_15 ���̺� 2���� ����(��³���:����ȣ,���޻�,SUM(���űݾ�) ���űݾ�)
--AMT14�� AMT15 2�� ���̺��� ����ȣ�� ���޻縦 �������� FULL OUTER JOIN �����Ͽ� ������ AMT_YEAR_FOJ ���̺� ����
--14��� 15���� ���űݾ� ���̸� ǥ���ϴ� ���� �÷��� �߰��Ͽ� ���(��, ����ȣ, ���޻纰�� ���űݾ� �� ������ ���еǾ�� ��)

