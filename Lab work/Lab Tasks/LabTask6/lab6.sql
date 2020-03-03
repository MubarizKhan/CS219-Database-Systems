select concat(emp_fname, emp_lname)
from employee natural join HOURS
where hours_per_attract > avg(hours_per_attract);
-- where date_worked > '%-05';