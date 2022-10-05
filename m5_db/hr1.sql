select * from employees;
select last_name, 'is a' job_id from employees;
select last_name||' is a '||job_id as EXPLAIN from employees;

--distinct
select distinct job_id from employees;

select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

--Q. employees 테이블에서 commission_pct의 null값 갯수를 출력
SELECT count(*) 
FROM EMPLOYEES  
WHERE commission_pct IS NULL;

--Q. employees 테이블에서 employee_id가 홀수인 것만 출력
select * from employees where mod(employee_id, 2) = 1;

select round(355.95555,2) from dual;
select round(355.95555,-2) from dual;
select trunc(45.55551,1) from dual;

select last_name, trunc(salary/12,2) 월급 from employees;

--width_bucket(지정값,최소값,최대값,bucket갯수)
select width_bucket(92,0,100,10) from dual;
select width_bucket(38,0,100,50) from dual;

select upper('Hello World') from dual;
select lower('Hello WOrld') from dual;

select last_name,salary from employees where last_name='king';
select last_name,salary from employees where lower(last_name)='king';

select job_id, length(job_id) from employees;
select substr('Hello World',3,3) from dual;
select substr('Hello World',-3,3) from dual;

select lpad('Hello World',20,'#') from dual;
select rpad('Hello World',20,'#') from dual;

select last_name, trim('A' from last_name) A삭제 from employees;
select ltrim('aaaHello Worldaaa','a') from dual;
select rtrim('aaaHello Worldaaa','a') from dual;
select trim('   Hello World   ') from dual;
select ltrim('   Hello World   ') from dual;
select rtrim('   Hello World   ') from dual;

select sysdate from dual;

select * from employees;
select last_name, trunc((sysdate-hire_date)/365,0) 근속연수 from employees;

--과제_1005_1. employees 테이블에서 채용일에 6개월을 추가한 날짜를 last_name과 같이 출력
--과제_1005_2. 이번달의 말일을 반환하는 함수를 사용하여 말일을 출력
--과제_1005_3. employees 테이블에서 채용일과 현재시점간의 근속월수를 출력
--과제_1005_4. 입사일 6개월 후 첫번째 월요일을 last_name별로 출력
--과제_1005_5. job_id별로 연봉합계 연봉평균 최고연봉 최저연봉 출력, 단 평균연봉이 5000 이상인 경우만 포함하여 내림차순으로 정렬
--과제_1005_6. 사원번호(EMPLOYEE_ID)가 110인 사원의 부서명을 출력
--과제_1005_7. 사번이 120번인 직원의 사번, 이름, 업무(job_id), 업무명(job_title)을 출력
--과제_1005_8. 사번, 이름, 직급, 출력하세요. 단, 직급은 아래 기준에 의함
        --salary > 20000 then '대표이사'
        --salary > 15000 then '이사' 
        --salary > 10000 then '부장' 
        --salary > 5000 then '과장' 
        --salary > 3000 then '대리'
        --나머지 '사원'
       
--과제_1005_9. emplyees 테이블에서 employee_id와 salary만 추출해서 employee_salary 테이블을 생성하여 출력
--과제_1005_10. employee_salary 테이블에 first_name, last_name 컬럼을 추가한 후 name으로 변경하여 출력
--과제_1005_11. employee_salary 테이블의 employee_id에 기본키를 적용하고 constraint_name을 ES_PK로 지정 후 출력
--과제_1005_12. employee_salary 테이블의 employee_id에서 contraint_name을 삭제 후 삭제 여부를 확인

