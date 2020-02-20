insert into employees values(
    111, '24/10/98', 'Mubariz', 'Saad',
    'M', '23-12-2132'
);

insert into employees values(
    121, '4/10/08', 'Ali', 'Mehdi',
    'M', '2-2-2002'
);

insert into employees values(
    101, '24/10/98', 'Muhammad', 'fahad',
    'M', '23-10-2012'
);

insert into employees values(
    131, '24/10/98', 'Mubariz', 'Saad',
    'M', '23-12-2132'
);

insert into employees values(
    141, '24/10/98', 'Fatima', 'N',
    'M', '23-02-1996'
);


insert into departments values(
    001, 'Security'
);

insert into departments values(
    002, 'RnD'
);

insert into departments values(
    003, 'Solar'
);

insert into departments values(
    004, 'Hydral'
);

insert into dept_emp values (
    111, 001, '2-10-2019', '2-10-2020'
);

insert into dept_emp values (
    121, 002, '2-20-2016', '12-02-2019'
);


insert into dept_emp values (
    131, 003, '2-08-2015', '01-22-2019'
);

insert into dept_emp values(
    141, 004, '5-23-2003', '12-31-2043'
);

INSERT into salaries values(
    111, 293000, '0', '0'
);

INSERT into salaries values(
    121, 232000, '0', '0'
);

INSERT into salaries values(
    131, 13000, '0', '0'
);

insert into titles values(
    111, 'Manager', '0', '0'
);

insert into titles values(
    121, 'Chairman', '0', '0'
);

insert into titles values(
    131, 'CEO', '0', '0'
);

insert into titles values(
    141, 'CFO', '0', '0'
);

update dept_emp
set dept_no = 004
where emp_no = 141;

update salaries
set salary = 999999
where emp_no = 131;

update departments
set dept_name = 'new_name'
where dept_name = 'RnD';

update titles
set title = 'King'
where title = 'CFO';

UPDATE employees
set hire_date = '2012-11-16'
where hire_date = '0000-00-00';

DELETE from employees
where Year(hire_date) like '%2016';

delete from departments;