select * from employees;
select last_name, 'is a' job_id from employees;
select last_name||' is a '||job_id as EXPLAIN from employees;

--distinct
select distinct job_id from employees;

select * from employees where commission_pct is null;
select * from employees where commission_pct is not null;

--Q. employees ���̺��� commission_pct�� null�� ������ ���
SELECT count(*) 
FROM EMPLOYEES  
WHERE commission_pct IS NULL;

--Q. employees ���̺��� employee_id�� Ȧ���� �͸� ���
select * from employees where mod(employee_id, 2) = 1;

select round(355.95555,2) from dual;
select round(355.95555,-2) from dual;
select trunc(45.55551,1) from dual;

select last_name, trunc(salary/12,2) ���� from employees;

--width_bucket(������,�ּҰ�,�ִ밪,bucket����)
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

select last_name, trim('A' from last_name) A���� from employees;
select ltrim('aaaHello Worldaaa','a') from dual;
select rtrim('aaaHello Worldaaa','a') from dual;
select trim('   Hello World   ') from dual;
select ltrim('   Hello World   ') from dual;
select rtrim('   Hello World   ') from dual;

select sysdate from dual;

select * from employees;
select last_name, trunc((sysdate-hire_date)/365,0) �ټӿ��� from employees;

--����_1005_1. employees ���̺��� ä���Ͽ� 6������ �߰��� ��¥�� last_name�� ���� ���
--����_1005_2. �̹����� ������ ��ȯ�ϴ� �Լ��� ����Ͽ� ������ ���
--����_1005_3. employees ���̺��� ä���ϰ� ����������� �ټӿ����� ���
--����_1005_4. �Ի��� 6���� �� ù��° �������� last_name���� ���
--����_1005_5. job_id���� �����հ� ������� �ְ��� �������� ���, �� ��տ����� 5000 �̻��� ��츸 �����Ͽ� ������������ ����
--����_1005_6. �����ȣ(EMPLOYEE_ID)�� 110�� ����� �μ����� ���
--����_1005_7. ����� 120���� ������ ���, �̸�, ����(job_id), ������(job_title)�� ���
--����_1005_8. ���, �̸�, ����, ����ϼ���. ��, ������ �Ʒ� ���ؿ� ����
        --salary > 20000 then '��ǥ�̻�'
        --salary > 15000 then '�̻�' 
        --salary > 10000 then '����' 
        --salary > 5000 then '����' 
        --salary > 3000 then '�븮'
        --������ '���'
       
--����_1005_9. emplyees ���̺��� employee_id�� salary�� �����ؼ� employee_salary ���̺��� �����Ͽ� ���
--����_1005_10. employee_salary ���̺� first_name, last_name �÷��� �߰��� �� name���� �����Ͽ� ���
--����_1005_11. employee_salary ���̺��� employee_id�� �⺻Ű�� �����ϰ� constraint_name�� ES_PK�� ���� �� ���
--����_1005_12. employee_salary ���̺��� employee_id���� contraint_name�� ���� �� ���� ���θ� Ȯ��

