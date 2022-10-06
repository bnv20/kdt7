--lmembers
SELECT COUNT(*) FROM PURPRD;
SELECT SUM(PURAMT) FROM PURPRD;
SELECT AVG(PURAMT) FROM PURPRD;

--Q. lmembers purprd 테이블로 부터 총구매액, 2014 구매액, 2015 구매액을 한번에 출력
select (select sum(p1.puramt) from purprd p1) as amt,
(select sum(p2.puramt) from purprd p2 where p2.purdate < 20150101) as amt_2014,
(select sum(p3.puramt) from purprd p3 where p3.purdate > 20141231) as amt_2015
from dual;

select sum(puramt) 총구매액, 
sum(case when purdate <= '20141231' then puramt end) "2014 구매액", 
sum(case when purdate > '20141231' and purdate <= '20151231' then puramt end) "2015 구매액"
from purprd;

--Q. lmembers 데이터에서 고객별 구매금액의 합계를 구한 cuspur 테이블을 생성한 후 demo 테이블과 고객번호(custno)를 기준으로 결합하여 출력
CREATE TABLE cuspur
AS select custno, sum(puramt) puramt_sum
FROM purprd 
GROUP BY custno
ORDER BY custno;

SELECT D.*, C.puramt_sum 
FROM demo D, cuspur C
WHERE D.custno = C.custno
ORDER BY D.custno;


--[과제_1006_1] purprd 데이터로 부터 아래 사항을 수행하세요.
--2년간 구매금액을 연간 단위로 분리하여 고객별, 제휴사별로 구매액을 표시하는 AMT_14, AMT_15 테이블 2개를 생성(출력내용:고객번호,제휴사,SUM(구매금액) 구매금액)
--AMT14와 AMT15 2개 테이블을 고객번호와 제휴사를 기준으로 FULL OUTER JOIN 적용하여 결합한 AMT_YEAR_FOJ 테이블 생성
--14년과 15년의 구매금액 차이를 표시하는 증감 컬럼을 추가하여 출력(단, 고객번호, 제휴사별로 구매금액 및 증감이 구분되어야 함)

