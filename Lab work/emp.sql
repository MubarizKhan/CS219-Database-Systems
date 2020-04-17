create TABLE dept(
    deptno numeric(2),
    dname varchar(14),
    loc varchar(13),
    CONSTRAINT dept_dname_uk UNIQUE (dname),
    CONSTRAINT dept_deptno_pk PRIMARY key(deptno)
);

create table emp(
    empno numeric(4),
    ename varchar (10) not null,
    job varchar (9),
    mgr numeric(4),
    hiredate date,
    sal numeric(7,2),
    comm numeric(7,2),
    deptno numeric(2) not null,
    constraint emp_deptno_fk foreign key (deptno) references dept (deptno)
);

insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(
    7839, 'KING', 'President','None', '17-NOV-81', 5000,0,  10
);

insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(
    7698, 'Blake', 'Manager','7839', '18-NOV-91', 2850,0,  30
);

insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(
    7782, 'Clark', 'Manager','7839', '18-JUN-91', 2450,0,  10
);

insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(
    7566, 'Jones', 'Manager','7839', '02-AUG-91', 2975,0,  20
);

insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(
    7654, 'Martin', 'SalesMan','7968', '07-AUG-91', 1800,0,  20
);

insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(
    7499, 'Allen', 'SalesMan','7968', '12-AUG-21', 1250,0,  20
);

insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) VALUES
(
    7844, 'Turner', 'SalesMan','7968', '22-AUG-91', 1500,0,  20
);

SELECT ename, sal, comm
    FROM   emp
  WHERE  sal<=comm;

  select ename, sal from emp where sal <= 1700;

select empno, ename, sal, mgr 
from emp
where mgr in (7902, 7566, 7788);

select ename as name, sal as salary 
from emp;



insert into dept(deptno, dname, loc) VALUES
(
    10, 'Accounting', 'New York'
);

select ename 
from emp
where ename LIKE 'S%';

 select ename
    from emp
     where ename LIKE '_A%';

insert into dept(deptno, dname, loc) VALUES
(
    20, 'Research', 'Dallas'
);

insert into dept(deptno, dname, loc) VALUES
(
    30, 'Sales', 'Chicago'
);

select ename, mgr 
from emp
where mgr = 0;

select ename, job, sal
from emp
where sal >= 800
and job = 'SalesMan';


select ename, job, sal
from emp
where sal >= 800
or job = 'President';


SELECT ename, job
from emp
order by deptno desc;

select ename, loc 
from emp, dept 
where emp.deptno = dept.deptno;

select * 
from emp
inner join dept
on emp.deptno = dept.deptno;

select avg(sal) as average, max(sal) as maximum, 
min(sal) as minimum , sum(sal) as summation
from emp;

select count(*)
from emp
where deptno = 30;

select deptno, avg(sal)
from emp
group by deptno;

select deptno, job, sum(sal)
from emp
group by deptno, job;

select deptno, max(sal)
from emp
group by deptno 
having max(sal) > 2900;

select job, sum(sal) as payroll
from emp
where job not like 'sales%'
group by job
having sum(sal) > 5000
order by sum(sal);

select ename as name 
from emp
where sal >
(select sal from emp
where empno = 7566);

select ename, job
from emp
where job = (select job
from emp
where empno = 7369)

and sal > (
    select sal
    from emp
    where empno = 7876
);