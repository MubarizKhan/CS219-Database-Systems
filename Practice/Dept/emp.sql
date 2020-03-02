create table emp(
    empno numeric(4),
    ename varchar (10) not null,
    job varchar (9),
    mgr numeric(4),
    hiredate date,
    sal numeric(7,2),
    comm numeric(7,2),
    deptno numeric(7,2) not null,
    constraint emp_deptno_fk foreign key (deptno) references dept (deptno)
);

create TABLE dept(
    deptno numeric(2),
    dname varchar(14),
    loc varchar(13),
    CONSTRAINT dept_dname_uk UNIQUE (dname),
    CONSTRAINT dept_deptno_pk PRIMARY key(deptno)
);


MariaDB [dbclass]> source emp.sql;
Query OK, 0 rows affected (0.049 sec)

ERROR 1050 (42S01): Table 'dept' already exists
MariaDB [dbclass]> create table emp(
    ->     empno numeric(4),
    ->     ename varchar (10) not null,
    ->     job varchar (9),
    ->     mgr numeric(4),
    ->     hiredate date,
    ->     sal numeric(7,2),
    ->     comm numeric(7,2),
    ->     deptno numeric(7,2) not null,
    ->     constraint emp_deptno_fk foreign key (deptno) references dept (deptno)
    -> );
ERROR 1050 (42S01): Table 'emp' already exists
MariaDB [dbclass]> drop database dbclass;
Query OK, 2 rows affected (0.071 sec)

MariaDB [(none)]> create database dbclass;
Query OK, 1 row affected (0.007 sec)

MariaDB [(none)]> use dbclass;
Database changed
MariaDB [dbclass]> source emp.sql;
ERROR 1005 (HY000): Can't create table `dbclass`.`emp` (errno: 150 "Foreign key constraint is incorrectly formed")
Query OK, 0 rows affected (0.048 sec)

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'MariaDB [dbclass]> source emp.sql' at line 1
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Query OK, 0 rows affected (0.049 sec)

ERROR 1050 (42S01): Table 'dept' already ' at line 1
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'ERROR 1050 (42S01): Table 'emp' already exists
MariaDB [dbclass]> drop database ' at line 1
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Query OK, 2 rows affected (0.071 sec)

MariaDB [(none)]> create database dbclass' at line 1
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Query OK, 1 row affected (0.007 sec)

MariaDB [(none)]> use dbclass' at line 1
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'Database changed' at line 1
MariaDB [dbclass]> show tables;
+-------------------+
| Tables_in_dbclass |
+-------------------+
| dept              |
+-------------------+
1 row in set (0.001 sec)

MariaDB [dbclass]> create table emp(
    ->     empno numeric(4),
    ->     ename varchar (10) not null,
    ->     job varchar (9),
    ->     mgr numeric(4),
    ->     hiredate date,
    ->     sal numeric(7,2),
    ->     comm numeric(7,2),
    ->     deptno numeric(2) not null,
    ->     constraint emp_deptno_fk foreign key (deptno) references dept (deptno)
    -> );
Query OK, 0 rows affected (0.046 sec)

MariaDB [dbclass]> show tables;
+-------------------+
| Tables_in_dbclass |
+-------------------+
| dept              |
| emp               |
+-------------------+
2 rows in set (0.001 sec)

MariaDB [dbclass]> tee create table emp(
MariaDB [dbclass]> MariaDB [dbclass]> SELECT ename, sal, comm
    ->     FROM   emp
    ->   WHERE  sal<=comm;
Empty set (0.003 sec)

MariaDB [dbclass]> select ename, sal from emp where sal <= 1700;
+--------+---------+
| ename  | sal     |
+--------+---------+
| Allen  | 1250.00 |
| Turner | 1500.00 |
+--------+---------+
2 rows in set (0.001 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select empno, ename, sal, mgr 
    -> from emp
    -> where mgr in (7902, 7566, 7788);
Empty set (0.001 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select ename as name, sal as salary 
    -> from emp;
+--------+---------+
| name   | salary  |
+--------+---------+
| KING   | 5000.00 |
| Blake  | 2850.00 |
| Clark  | 2450.00 |
| Jones  | 2975.00 |
| Martin | 1800.00 |
| Allen  | 1250.00 |
| Turner | 1500.00 |
+--------+---------+
7 rows in set (0.002 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select ename 
    -> from emp
    -> where ename LIKE 'S%';
Empty set (0.001 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select ename 
    -> from emp
    -> where ename LIKE 'S';
Empty set (0.000 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select ename 
    -> from emp
    -> where ename LIKE '_A%';
+--------+
| ename  |
+--------+
| Martin |
+--------+
1 row in set (0.000 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select ename, mgr 
    -> from emp
    -> where mgr = 0;
+-------+------+
| ename | mgr  |
+-------+------+
| KING  |    0 |
+-------+------+
1 row in set (0.001 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select ename, job, sal
    -> from emp
    -> where sal >= 1100
    -> and job = 'clerk';
Empty set (0.001 sec)

MariaDB [dbclass]> select ename, job, sal
    -> from emp
    -> where sal >= 800
    -> and job = 'SalesMan';
+--------+----------+---------+
| ename  | job      | sal     |
+--------+----------+---------+
| Martin | SalesMan | 1800.00 |
| Allen  | SalesMan | 1250.00 |
| Turner | SalesMan | 1500.00 |
+--------+----------+---------+
3 rows in set (0.000 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select ename, job, sal
    -> from emp
    -> where sal >= 800
    -> or job = 'President';
+--------+-----------+---------+
| ename  | job       | sal     |
+--------+-----------+---------+
| KING   | President | 5000.00 |
| Blake  | Manager   | 2850.00 |
| Clark  | Manager   | 2450.00 |
| Jones  | Manager   | 2975.00 |
| Martin | SalesMan  | 1800.00 |
| Allen  | SalesMan  | 1250.00 |
| Turner | SalesMan  | 1500.00 |
+--------+-----------+---------+
7 rows in set (0.000 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> SELECT ename, job
    -> from emp
    -> where job not in ('President','SalesMan');
+-------+---------+
| ename | job     |
+-------+---------+
| Blake | Manager |
| Clark | Manager |
| Jones | Manager |
+-------+---------+
3 rows in set (0.002 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> SELECT ename, job
    -> from emp
    -> where job not in ('President','SalesMan');
+-------+---------+
| ename | job     |
+-------+---------+
| Blake | Manager |
| Clark | Manager |
| Jones | Manager |
+-------+---------+
3 rows in set (0.000 sec)

MariaDB [dbclass]> order by deptno;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'order by deptno' at line 1
MariaDB [dbclass]> SELECT ename, job
    -> from emp
    -> where job not in ('President','SalesMan');
+-------+---------+
| ename | job     |
+-------+---------+
| Blake | Manager |
| Clark | Manager |
| Jones | Manager |
+-------+---------+
3 rows in set (0.000 sec)

MariaDB [dbclass]> SELECT ename, job
    -> from emp
    -> order by deptno;
+--------+-----------+
| ename  | job       |
+--------+-----------+
| KING   | President |
| Clark  | Manager   |
| Jones  | Manager   |
| Martin | SalesMan  |
| Allen  | SalesMan  |
| Turner | SalesMan  |
| Blake  | Manager   |
+--------+-----------+
7 rows in set (0.001 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> SELECT ename, job
    -> from emp
    -> order by deptno desc;
+--------+-----------+
| ename  | job       |
+--------+-----------+
| Blake  | Manager   |
| Jones  | Manager   |
| Martin | SalesMan  |
| Allen  | SalesMan  |
| Turner | SalesMan  |
| KING   | President |
| Clark  | Manager   |
+--------+-----------+
7 rows in set (0.001 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select ename, loc 
    -> from emp, dept 
    -> where emp.deptno = dept.deptno;
+--------+----------+
| ename  | loc      |
+--------+----------+
| KING   | New York |
| Blake  | Chicago  |
| Clark  | New York |
| Jones  | Dallas   |
| Martin | Dallas   |
| Allen  | Dallas   |
| Turner | Dallas   |
+--------+----------+
7 rows in set (0.003 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select * 
    -> from emp
    -> inner join dept
    -> on emp.deptno = dept.deptno;
+-------+--------+-----------+------+------------+---------+------+--------+--------+------------+----------+
| empno | ename  | job       | mgr  | hiredate   | sal     | comm | deptno | deptno | dname      | loc      |
+-------+--------+-----------+------+------------+---------+------+--------+--------+------------+----------+
|  7839 | KING   | President |    0 | 0000-00-00 | 5000.00 | 0.00 |     10 |     10 | Accounting | New York |
|  7698 | Blake  | Manager   | 7839 | 0000-00-00 | 2850.00 | 0.00 |     30 |     30 | Sales      | Chicago  |
|  7782 | Clark  | Manager   | 7839 | 0000-00-00 | 2450.00 | 0.00 |     10 |     10 | Accounting | New York |
|  7566 | Jones  | Manager   | 7839 | 0000-00-00 | 2975.00 | 0.00 |     20 |     20 | Research   | Dallas   |
|  7654 | Martin | SalesMan  | 7968 | 0000-00-00 | 1800.00 | 0.00 |     20 |     20 | Research   | Dallas   |
|  7499 | Allen  | SalesMan  | 7968 | 0000-00-00 | 1250.00 | 0.00 |     20 |     20 | Research   | Dallas   |
|  7844 | Turner | SalesMan  | 7968 | 0000-00-00 | 1500.00 | 0.00 |     20 |     20 | Research   | Dallas   |
+-------+--------+-----------+------+------------+---------+------+--------+--------+------------+----------+
7 rows in set (0.001 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select avg(sal) as average, max(sal) as maximum, 
    -> min(sal) as minimum , sum(sal) as summation
    -> from emp;
+-------------+---------+---------+-----------+
| average     | maximum | minimum | summation |
+-------------+---------+---------+-----------+
| 2546.428571 | 5000.00 | 1250.00 |  17825.00 |
+-------------+---------+---------+-----------+
1 row in set (0.002 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select count(*)
    -> from emp
    -> where deptno = 30;
+----------+
| count(*) |
+----------+
|        1 |
+----------+
1 row in set (0.001 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select deptno, avg(sal)
    -> from emp
    -> group by deptno;
+--------+-------------+
| deptno | avg(sal)    |
+--------+-------------+
|     10 | 3725.000000 |
|     20 | 1881.250000 |
|     30 | 2850.000000 |
+--------+-------------+
3 rows in set (0.001 sec)

MariaDB [dbclass]> 
MariaDB [dbclass]> select deptno, job, sum(sal)
    -> from emp
    -> group by deptno, job;
+--------+-----------+----------+
| deptno | job       | sum(sal) |
+--------+-----------+----------+
|     10 | Manager   |  2450.00 |
|     10 | President |  5000.00 |
|     20 | Manager   |  2975.00 |
|     20 | SalesMan  |  4550.00 |
|     30 | Manager   |  2850.00 |
+--------+-----------+----------+
5 rows in set (0.008 sec)

