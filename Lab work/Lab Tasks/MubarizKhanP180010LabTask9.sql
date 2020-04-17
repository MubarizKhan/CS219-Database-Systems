1
CREATE VIEW emp_details AS 
select emp_num,emp_fname, emp_lname, emp_dob, employee.park_code, themepark.park_name
from employee, themepark where employee.park_code = themepark.park_code;
Query OK, 0 rows affected (0.006 sec)

2. Select * from emp_details;
+---------+-----------+------------+------------+-----------+--------------+
| emp_num | emp_fname | emp_lname  | emp_dob    | park_code | park_name    |
+---------+-----------+------------+------------+-----------+--------------+
|     100 | Emma      | Calderdale | 1972-06-15 | FR1001    | FairyLand    |
|     101 | Marshel   | Ricardo    | 1978-03-19 | UK3452    | PleasureLand |
|     102 | Arif      | Arshad     | 1969-11-14 | FR1001    | FairyLand    |
|     103 | Anne      | Roberts    | 1974-10-16 | UK3452    | PleasureLand |
|     104 | Enrica    | Denver     | 1980-11-08 | ZA1342    | GoldTown     |
|     105 | Mirrelle  | Namowa     | 1990-03-14 | FR1001    | FairyLand    |
|     106 | Gemma     | Smith      | 1968-02-12 | ZA1342    | GoldTown     |
+---------+-----------+------------+------------+-----------+--------------+

3.
MariaDB [themepark]> select emp_fname, emp_lname, park_name from emp_details;
+-----------+------------+--------------+
| emp_fname | emp_lname  | park_name    |
+-----------+------------+--------------+
| Emma      | Calderdale | FairyLand    |
| Marshel   | Ricardo    | PleasureLand |
| Arif      | Arshad     | FairyLand    |
| Anne      | Roberts    | PleasureLand |
| Enrica    | Denver     | GoldTown     |
| Mirrelle  | Namowa     | FairyLand    |
| Gemma     | Smith      | GoldTown     |
+-----------+------------+--------------+
7 rows in set (0.001 sec)



4

CREATE USER mubariz@localhost identified by 'khan';
Query OK, 0 rows affected (0.006 sec)

5


GRANT SELECT ON `themepark` TO 'mubariz'@'localhost';
Query OK, 0 rows affected (0.006 sec)

GRANT SELECT ON `emp_details` TO 'mubariz'@'localhost'; 
Query OK, 0 rows affected (0.006 sec)

GRANT CREATE ON *.* TO 'mubariz'@'localhost';
Query OK, 0 rows affected (0.006 sec)
 

6

CREATE VIEW view AS 
select *
from employee;

Query OK, 0 rows affected (0.015 sec)

select * from view;
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
| EMP_NUM | EMP_TITLE | EMP_LNAME  | EMP_FNAME | EMP_DOB    | EMP_HIRE_DATE | EMP_AREA_CODE | EMP_PHONE | PARK_CODE |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
|     100 | Ms        | Calderdale | Emma      | 1972-06-15 | 1992-03-15    | 0181          | 324-9134  | FR1001    |
|     101 | Ms        | Ricardo    | Marshel   | 1978-03-19 | 1996-04-25    | 0181          | 324-4472  | UK3452    |
|     102 | Mr        | Arshad     | Arif      | 1969-11-14 | 1990-12-20    | 7253          | 675-8993  | FR1001    |
|     103 | Ms        | Roberts    | Anne      | 1974-10-16 | 1994-08-16    | 0181          | 898-3456  | UK3452    |
|     104 | Mr        | Denver     | Enrica    | 1980-11-08 | 2001-10-20    | 7253          | 504-4434  | ZA1342    |
|     105 | Ms        | Namowa     | Mirrelle  | 1990-03-14 | 2006-11-08    | 0181          | 890-3243  | FR1001    |
|     106 | Mrs       | Smith      | Gemma     | 1968-02-12 | 1989-01-05    | 0181          | 324-7845  | ZA1342    |
+---------+-----------+------------+-----------+------------+---------------+---------------+-----------+-----------+
7 rows in set (0.001 sec)

select * from employee;




7

REVOKE CREATE ON *.* FROM 'mubariz'@'localhost';
Query OK, 0 rows affected (0.005 sec)