CREATE VIEW emp_details AS 
select emp_num,emp_fname, emp_lname, emp_dob, employee.park_code, themepark.park_name
from employee, themepark where employee.park_code = themepark.park_code;

Select * from emp_details;

select emp_fname, emp_lname, park_name from emp_details;

CREATE USER mubariz@localhost identified by 'khan';

GRANT SELECT ON `themepark` TO 'mubariz'@'localhost';

GRANT SELECT ON `emp_details` TO 'mubariz'@'localhost'; 

GRANT CREATE ON *.* TO 'mubariz'@'localhost';

CREATE VIEW view AS 
select *
from employee;


REVOKE CREATE ON *.* FROM 'mubariz'@'localhost';