select * from employees;

select count(*) from employees;

--Q. HR employees ���̺��� �̸�, ����, 10% �λ�� ������ ���
SELECT first_name, last_name, salary ����, salary*1.1 �λ󿬺�
FROM EMPLOYEES e ;

--Q. HR employees ���̺��� COMMISSION_PCT�� null�� ������ ���
SELECT COUNT(*)
FROM EMPLOYEES e 
WHERE COMMISSION_PCT IS NULL;

--[����_1006_2] hr ���̺���� �м��ؼ� ��ü ��Ȳ�� ������ �� �ִ� ��� ���̺��� 2�� �̻� �ۼ��ϼ���(��:�μ��� ��� salary ����)

--DCL

--user ����, ����
create user c##user01
identified by userpass;

select * from all_users;
drop user c##user01;

--grant, revoke
create user c##user01
identified by userpass;
grant create session, create table to c##user01;
revoke create session, create table from c##user01;

--����� ��ȣ ����
alter user c##user01
identified by passuser;

--����
drop user c##user01 cascade;

create table users(
id number,
name varchar2(20),
age number);

insert into users values(1,'hong gildong',30);
insert into users values(2,'hong gilsun',30);
select * from users;

delete from users where id=1;
select * from users;
rollback;
drop table users;
commit;
--autocommit Ȯ�� �� ����
show autocommit;
set autocommit on;
set autocommit off;

