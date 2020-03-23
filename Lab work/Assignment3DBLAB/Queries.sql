select first_name,last_name from employees where salary = (select max(salary) from employees);


 select employee_id, first_name,salary from employees where salary = (select max(salary) from employees where job_id like '%clerk%');

 select employee_id, first_name,salary from employees where job_id like '%account%' having salary > (select max(salary) from employees where job_id like '%clerk%');
 select employee_id, first_name,salary from employees where job_id like '%clerk%' having salary > (select min(salary) from employees where job_id like '%prog%');


 select salary from employees where salary > first_name like '%peter%' or '%lisa%';
 
 select first_name from employees where salary > all(select avg(salary) from employees group by department_id);

select first_name,last_name,department_id,max(salary) from employees group by department_id;

select e.first_name, j.job_title from employees e join departments d on e.department_id = d.department_id join jobs j on j.job_id = e.job_id where e.department_id = 20 and e.job_id in (select job_id from employees where department_id = 50);



select first_name, salary, department_id from employees where salary in (select max(salary) from employees group by job_id);


 SELECT first_name, last_name FROM employees e WHERE department_id = 20 AND employee_id = (SELECT employee_id FROM employees e2 WHERE department_id = 30 AND e2.job_id = e.job_id);



 select first_name, department_id from employees where department_id in (select department_id from employees where department_id = 100);

select first_name,job_id from employees where salary > (select max(salary) from employees where department_id = 20 and department_id = 30); select e.first_name, d.location_id from employees e join departments d on d.department_id = e.department_id where location_id = (select location_id from locations where city = 'Sydney');


 select * from employees where department_id = (select department_id from employees where department_id = 10);


select job_id,job_title from jobs group by job_id having sum(max_salary) > (select max(max_salary) from jobs where job_title like '%manager%');


 select department_name from departments where department_id in (select department_id from employees group by department_id having max(salary) > 9000);

 select first_name from employees e where e.department_id = 10 and salary > any (select salary from employees where department_id != 10);

 select first_name from employees where job_id like (select job_id from employees where department_id in (select department_id from departments where location_id = 2700));



select e.first_name, d.department_name, j.job_title, l.city from employees e join departments d on e.department_id = d.department_id join jobs j on e.job_id = j.job_id join locations l on d.location_id = l.location_id


 select first_name, max(salary) from employees where salary <(select max(salary) from employees);


 select d.department_name, count(e.department_id) from departments d join employees e on e.department_id = d.department_id group by e.department_id having count(e.department_id) < 3;


