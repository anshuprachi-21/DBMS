CREATE DATABASE HR;
USE HR;
CREATE TABLE emp(
EMPNO DECIMAL(4,0) NOT NULL,
EMPNAME VARCHAR(10) DEFAULT NULL,
JOB VARCHAR(20) DEFAULT NULL,
MGR DECIMAL(4,0) DEFAULT NULL,
HIRDATE DATE DEFAULT  NULL,
SAL DECIMAL (7,2) DEFAULT NULL,
COM DECIMAL(7,2) DEFAULT NULL,
DEPNO DECIMAL (2,0) DEFAULT NULL 
);
CREATE TABLE DEPT(
DEPNO DECIMAL(2,0) DEFAULT NULL,
DNAME  VARCHAR(14) DEFAULT NULL,
LOC VARCHAR (13) DEFAULT NULL);
CREATE TABLE SALGRADE(
GRADE INT NOT NULL PRIMARY KEY,
LOSAL INT NOT NULL,
HISAL INT NOT NULL);

ALTER TABLE emp
add constraint pk_empno primary key(EMPNO);
ALTER TABLE DEPT
add constraint pk_deono primary key(DEPNO);
ALTER TABLE emp
add constraint  foreign key(DEPNO) references DEPT(DEPNO);
select * from emp;
select * from DEPT;
SELECT * FROM SALGRADE;
INSERT INTO dept VALUES (10, 'ACCOUNTING', 'NEW YORK'), 
	(20, 'RESEARCH', 'DALLAS'),
	(30, 'SALES', 'CHICAGO'),
	(40, 'OPERATIONS', 'BOSTON');

INSERT INTO emp VALUES
	(7369, 'SMITH', 'CLERK', 7902, STR_TO_DATE('17-DEC-80','%d-%b-%y'), 800, NULL, 20),
	(7499, 'ALLEN', 'SALESMAN', 7698, STR_TO_DATE('20-FEB-81','%d-%b-%y'), 1600, 300, 30),
	(7521, 'WARD', 'SALESMAN', 7698, STR_TO_DATE('22-FEB-81','%d-%b-%y'), 1250, 500, 30),
	(7566, 'JONES', 'MANAGER', 7839, STR_TO_DATE('02-APR-81','%d-%b-%y'), 2975, NULL, 20),
	(7654, 'MARTIN', 'SALESMAN', 7698, STR_TO_DATE('28-SEP-81','%d-%b-%y'), 1250, 1400, 30),
	(7698, 'BLAKE', 'MANAGER', 7839, STR_TO_DATE('01-MAY-81','%d-%b-%y'), 2850, NULL, 30),
	(7782, 'CLARK', 'MANAGER', 7839, STR_TO_DATE('09-JUN-81','%d-%b-%y'), 2450, NULL, 10),
	(7788, 'SCOTT', 'ANALYST', 7566, STR_TO_DATE('19-APR-87','%d-%b-%y'), 3000, NULL, 20),
	(7839, 'KING', 'PRESIDENT', NULL, STR_TO_DATE('17-NOV-81','%d-%b-%y'), 5000, NULL, 10),
	(7844, 'TURNER', 'SALESMAN', 7698, STR_TO_DATE('08-SEP-81','%d-%b-%y'), 1500, 0, 30),
	(7876, 'ADAMS', 'CLERK', 7788, STR_TO_DATE('23-MAY-87','%d-%b-%y'), 1100, NULL, 20),
	(7900, 'JAMES', 'CLERK', 7698, STR_TO_DATE('03-DEC-81','%d-%b-%y'), 950, NULL, 30),
	(7902, 'FORD', 'ANALYST', 7566, STR_TO_DATE('03-DEC-81','%d-%b-%y'), 3000, NULL, 20),
	(7934, 'MILLER', 'CLERK', 7782, STR_TO_DATE('23-JAN-82','%d-%b-%y'), 1300, NULL, 10);

INSERT INTO salgrade VALUES
	(1, 700, 1200),
	(2, 1201, 1400),
	(3, 1401, 2000),
	(4, 2001, 3000),
	(5, 3001, 9999);
    
SELECT * FROM emp;
 -- BASIC SQL QUERIES (EASY LEVEL)..............................................................................................................

select * from emp; -- DISPLAY ALL DETAILS OF EMPLOYEES

select SAL,EMPNAME FROM emp; -- DISPLAY EMPLOYEE NAME AND SALARY 

SELECT EMPNAME,DEPNO FROM emp; -- DISPLAY EMPLOYEE NAME AND DEPARTMENT NUMBER

SELECT distinct JOB FROM emp;  -- DISPLAY DISTINCT JOB TITLES FROM EMP TABLE

SELECT * FROM emp WHERE DEPNO = 30; -- DISPLAY EMPLOYEE WHO BELONG TO DEPARTMENT NUMBER 30

SELECT * FROM emp WHERE SAL > 2000;  -- DISPLAY THE EMPLOYEE WHOSE SALARY GREATER THEN 2000 

SELECT * FROM emp WHERE HIRDATE > STR_TO_DATE('01-JAN-1981', '%d-%b-%Y'); -- DIPLAY THE EMPLOYEE WHO HIRED AFTER 01-JAN-1981

SELECT * FROM emp WHERE EMPNAME LIKE 'S%'; -- DISPLAY THE EMPLOYEE WHOS NAME START WITH THE LATTER S

SELECT * FROM emp WHERE COM IS NOT NULL AND COM > 0; -- DISPLAY THE EMPLOYEE WHO RECEIVE ANY COMMISSION

SELECT * FROM emp WHERE DEPNO IN (10, 20); -- DISPLAY THE EMPLOYEE WHOSE DEPARTMENT NUMBER 10 OR 20

SELECT * FROM emp ORDER BY SAL DESC; -- DISPLAY ALL EMPLOYEE SORTED BY SALARY IN DESCENDING ORDER

SELECT EMPNAME ,SAL,COM FROM emp ORDER BY EMPNAME; -- DISPLAY EMPLOYEES NAME SALARY AND COMMISSION SORTED BY NAME

SELECT * FROM emp WHERE MGR IS NULL; -- DISPLAY EMPLOYEE WHO HAVE NO MANAGER 

SELECT LOC FROM DEPT WHERE DEPNO=20; -- DISPLAY THE LOCATION OF DEPARTMENT NUMBER 20

SELECT * FROM DEPT ORDER BY DNAME; -- DISPLAY DEPARTMENT DETAILS SORTED BY DEPARTMENT NAME IN ALPHABETICAL ORDER

SELECT * FROM emp WHERE SAL BETWEEN 1000 AND 3000 ; -- DISPLAY EMPLOYEES WHOSE SALARY IS BETWEEN 1000 AND 3000

SELECT count(EMPNO) FROM emp; -- COUNT THE TOTAL NUMBER OF EMPLOYEES IN THE EMP TABLE 

SELECT MAX(SAL),MIN(SAL) FROM emp; -- DISPLAY THE MINIMUM AND MAXIMUM SALARY FROM THE EMP TABLE

SELECT JOB,count(JOB) FROM emp group by JOB; -- DISPLAY TOTAL NUMBER OF EMPLOYEES FOR EACH JOB TITLE

SELECT  NOW() CURRENT_SYSTEM_DATE; -- DISPLAY THE CURRENT SYATEM DATA IN MYSQL


-- MODERATE LEVEL.......................................................................................................................

SELECT EMPNAME,SAL,(SAL*12) FROM emp; -- DISPLAY EMPLOYEE NAME ,SALARY AND YEARLY SALARY (SALARY*12)

-- SELECT EMPNAME,HIRDATE FROM emp WHERE HIRDATE>=STR_TO_DATE('01-JAN-1981', '%d-%b-%Y') AND HIRDATE<=str_to_date('31-DEC-1981','%d-%b-%Y');
SELECT EMPNAME,HIRDATE FROM emp WHERE year(HIRDATE)= 1981; -- DISPLAY EMPLOYEE WHO JOINED THE YEAR 1981

SELECT * FROM emp ORDER BY HIRDATE DESC; -- DISPLAY EMPLOYEE DETAILS SORTED BY HIRE DATE IN DESCENDING ORDER
 -- SELECT JOB,count(JOB) FROM emp GROUP BY JOB;
 
SELECT DEPNO,avg(SAL) FROM emp group by DEPNO ; -- DISPLAY AVERGE SALARY OF EACH DEPARTMENT 

SELECT e.EMPNAME, d.DNAME
FROM emp e
JOIN dept d
ON e.DEPNO = d.DEPNO; -- DISPLAY EMPLOYEE NAME ALONG WITH DEPARTMENT NAME USING A JOIN OPERTION

SELECT  * FROM emp WHERE SAL>(SELECT AVG(SAL) FROM EMP); -- DISPLAY EMPLOYEES EARING MORE THEN THE AVERGE SALARY OF THE COMPANY

SELECT EMPNAME FROM EMP WHERE COM>0; -- DISPLAY EMPLOYEES WHO HAVE COMMISSION IN EACH DEPARTMENT 


SELECT * FROM emp WHERE EMPNAME LIKE '%a%'; -- DISPLAY EMPLOYEE WHOSE NAME CONTAINS THE CHARACTER A(CASE_INSENSITIVE)

SELECT MAX(SAL),JOB FROM emp GROUP BY JOB; -- DISPLAY THE HIGHEST SALARY OF EACH JOB TITALE


select e.empname, e.depno, d.dname ,loc
from emp e 
inner join dept d on e.depno = d.depno 
where d.loc = 'NEW YORK'; -- DISPLAY EMPLOYEES WHO WORK IN THE DEPARTMENT LOCATED IN NEW YORK

select * from emp where weekday(HIRDATE)='monday'; -- DISPLAY THE EMPLOYEES WHO WERE HIRED ON A MONDAY

select count(*) from emp where com is NULL ; -- COUNT THE NUMBER OF EMPLOYEES WHO DO NOT RECEVIE COMMISSION

SELECT JOB, SUM(com) AS total_commission FROM emp GROUP BY JOB; -- DISPLAY JOB TITALES ALONG WITH THE TOTAL COMMISSION PAID FOR EACH JOB

SELECT DNAME, (SELECT COUNT(*) 
        FROM emp 
        WHERE emp.DEPNO = dept.DEPNO) AS total_employee FROM DEPT 
WHERE DEPNO IN (SELECT DEPNO FROM emp GROUP BY DEPNO HAVING COUNT(*)>3 ); -- DISPLAY DEPARTMENT WHO HAVE MORE THEN 3 EMPLOYEES 

SELECT EMPNAME, SAL
FROM emp WHERE SAL = (SELECT MAX(SAL) FROM emp WHERE SAL < (SELECT MAX(SAL) FROM emp)); -- DISPLAY THE EMPLOYEE WHO DRAW THE SECOND HIGEST SALARY


SELECT EMPNAME,JOB FROM EMP 
WHERE JOB=(SELECT JOB FROM EMP WHERE EMPNAME= 'SMITH') AND EMPNAME <> 'SMITH'; -- DISPLAY THE EMPLOYEES WHO HAVE THE SAME JOB TITLE AS SMITH 

SELECT EMPNAME,GRADE AS SALARY_GRADE 
FROM SALGRADE,EMP 
WHERE EMP.SAL between SALGRADE.LOSAL AND SALGRADE.HISAL; -- DISPLAY EACH EMPLOYEES GRADE USING THE SALGRADE TABLE

SELECT EMPNAME,SAL,GRADE AS SALARY_GRADE
FROM EMP,SALGRADE
WHERE EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL; -- DISPLAY EMPLOYEES SALARY AND SALARY GRADE TOGETHE

SELECT EMPNAME FROM EMP WHERE EMPNO in (select mgr from emp); -- DISPLAY EMPLOYEES WHO ARE MANAGERS

SELECT * FROM EMP  WHERE DEPNO=30 ORDER BY  SAL DESC LIMIT 1; -- DISPLAY THE EMPLOYEES WHO EARNS THE HIGEST SALARY IN DEPARTMENT 30

-- ADVANCE LEVEL...........................................................................................................

SELECT EMPNAME ,SAL  FROM EMP  WHERE SAL= (select  MAX(SAL) FROM EMP); -- Display the employee(s) who earn the highest salary in the company.

SELECT EMPNAME,DEPNO,SAL FROM emp e
WHERE SAL>(SELECT AVG(SAL) FROM EMP where depno=e.depno) ; -- Display employees who earn more than the average salary of their department.

SELECT DEPNO,SUM(SAL) AS total_sal from emp group by DEPNO ORDER BY total_sal  desc limit 1; -- Display the department having the maximum total salary paid to employees.


SELECT e.empname  from emp e 
join emp m on e.mgr= m.empno where e.hirdate<m.hirdate; -- Display employees who joined before their respective manager joined.

select * from dept where depno not in (select depno from emp); -- Display department details where no employees are working.

select empname ,sal from emp order by sal desc limit 2,1; -- Display the third highest salary using a subquery.


select monthname(hirdate),count(empno) from emp  group  by monthname(hirdate) ; -- Display the count of employees hired month-wise.

select * from emp where hirdate >(select hirdate from emp where empname='FORD'); -- Display employees who joined after the employee FORD joined.

select empname from emp where depno not in(select depno from dept); -- Display the employees whose department number is not present in the DEPT table

select JOB ,max(sal)-min(sal) from emp group by job; -- Display job titles along with the difference between maximum and minimum salary of that job.

select empname ,length(empname) from emp; -- Display employee names along with the length of each name.

select empname ,round(SAL,2) from emp; -- Display salaries formatted to two decimal places.

select concat(left(empname,3),repeat("*",length(empname)-3)) as masked_name from emp; -- Display each employee name masked after the first three characters (example: SMI*****).


select empname, ifnull(com,"No commision") from emp; -- Display employee name and commission, replacing NULL values with the text 'No Commission'.

create view view1 as select empname,sal,dEPNO from emp; -- Create a view to display employee name, salary and department name.
select * from view1;

update emp set sal=sal+sal*0.1 where depno = 30 ; -- Update the salary of employees in department 30 by increasing it by 10 percent.
select * from emp;

DELETE FROM emp
WHERE depno IS NULL; -- Delete employees who do not belong to any department.

INSERT INTO dept (depno, dname)
VALUES (50, 'HR'); -- Insert a new department with department number 50 and department name "HR".
select * from dept;

SELECT *
FROM emp
WHERE depno = (SELECT depno FROM emp WHERE empname = 'BLAKE') AND EMPNAME <> 'BLAKE'; -- Display employees working in the same department as BLAKE.

SELECT *
FROM emp
WHERE JOB IN (
    SELECT JOB
    FROM emp
    GROUP BY JOB
    HAVING COUNT(*) > 1
);  -- Display employees whose job title appears more than once in the EMP table.
-- ADVANCE LEVEL 61 TO 80.................................................................................................................
select * from emp where sal>(select max(sal) from emp where depno=10); -- Display employee details whose salary is higher than the maximum salary of employees in department 10.

SELECT *
FROM emp
WHERE sal > ALL (
  SELECT sal
  FROM emp
  WHERE depno = 30
); -- Display employees who earn more than every employee in department 30.

SELECT DEPNO
FROM emp
GROUP BY DEPNO
HAVING MIN(COM) IS NOT NULL; -- Display departments where all employees earn a commission.

select * from emp e where e.sal=(select avg(sal) from emp where depno=e.depno); -- Display employees whose salary matches the average salary of their own department.

SELECT * 
FROM emp
WHERE sal = (
    SELECT AVG(sal)
    FROM emp 
    WHERE depno = emp.depno
); -- Display job title and employees whose salary is below the average salary of that job.
-- or select e.empname,e.job from emp e where e.sal<(select avg(sal) from emp where job = e.job); 

select * from emp e where e.sal=(select min(sal) from emp where depno=e.depno); --  Display employees who have the minimum salary in their respective job.

SELECT *
FROM emp e
WHERE e.DEPNO IN (
    SELECT d2.DEPNO
    FROM DEPT d2
    WHERE d2.LOC = (
        SELECT d.LOC
        FROM emp k
        JOIN DEPT d ON k.DEPNO = d.DEPNO
        WHERE k.EMPNAME = 'KING'
    )
); -- Display employees who work in a department located in the same city as the department of KING.

SELECT *
FROM emp e
WHERE NOT EXISTS (
  SELECT *
  FROM salgrade 
  WHERE e.sal BETWEEN losal AND hisal
); -- Display employees whose salary is not within any salary grade range.

select * from emp e where sal=(select max(sal) from emp where sal<(select max(sal) from emp) and depno=e.depno); -- Display employees who earn the second highest salary in each department.

select distinct e.depno from emp e where e.depno in (select distinct depno from emp where job='MANAGER'); -- Display employees whose department has at least one manager working in it.

select distinct e.depno from emp e where e.depno not in (select distinct depno from emp where job='MANAGER'); -- Display departments where no manager is assigned based on EMP table details.

SELECT e.empname, e.sal
FROM emp e
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE s.grade = (SELECT MAX(grade) FROM salgrade); -- Display employees who earn a salary that falls into the highest grade in SALGRADE.


select e.empname,e.sal, e.depno from emp e where exists (select 1 from emp f where e.sal = f.sal and e.depno != f.depno); -- Display employees who have the same salary as someone in a different department.
select * from emp;
update emp set sal=sal+255 where empno =7900;

-- or
SELECT DISTINCT e1.*
FROM emp e1
JOIN emp e2 ON e1.sal = e2.sal AND e1.depno <> e2.depno;

select e.empname,e.hirdate,e.depno from emp e where e.hirdate=(select min(hirdate) from emp where depno = e.depno); -- Display the employee who has the earliest hire date in each department using a correlated subquery.

SELECT depno
FROM emp
GROUP BY depno
HAVING COUNT(*) < (
  SELECT AVG(emp_count)
  FROM (
    SELECT COUNT(*) AS emp_count
    FROM emp
    GROUP BY depno
  ) AS dep_count
); -- Display all departments that have less than the average number of employees compared to all departments.

SELECT e.empname FROM emp e
JOIN
emp m ON e.mgr = m.empno
JOIN
dept d1 ON e.depno = d1.depno
JOIN
dept d2 ON m.depno = d2.depno
WHERE
d1.loc <> d2.loc; -- Display employees whose managers work in a different location than the employee.

SELECT *
FROM emp
WHERE DEPNO = (
    SELECT DEPNO
    FROM emp
    GROUP BY DEPNO
    HAVING SUM(SAL) >= ALL (
        SELECT SUM(SAL)
        FROM emp
        GROUP BY DEPNO
    )
); -- Display employees who work in a department where the total salary is greater than all other departments.

SELECT d.dname, e.empname
FROM emp e
JOIN dept d ON e.depno = d.depno
WHERE e.sal > (
  SELECT AVG(sal)
  FROM emp
  WHERE job = 'MANAGER'
); -- Display the name of the department and employees who earn a salary greater than the average salary of all managers.

SELECT d.dname, e.empname
FROM emp e
JOIN emp m ON e.mgr = m.empno
JOIN dept d ON e.depno = d.depno
WHERE e.sal > m.sal; -- Display the department name and employee name for employees who earn more than their manager.

SELECT e.empname, e.sal, d.dname
FROM emp e
JOIN dept d ON e.depno = d.depno
JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE s.grade = 3; -- Display employee name, salary, and department name for employees whose salary is within salary grade 3.













