select park_code, ticket_no,ticket_type,ticket_price, ticket_price + round((ticket_price * 0.1),2) from ticket;
select park_code, ticket_no,ticket_type,ticket_price, ticket_price + rounf((ticket_price * 0.1),2) as ajeeb from ticket;

alter table attraction
modify attract_capacity numeric(5);

select park_code,ticket_type,ticket_price
from ticket
where ticket_price>20;

select park_code,ticket_type,ticket_price
from ticket
where ticket_price < 30;

select park_code,park_name,park_country
from themepark
where park_code < 'UK2262'

-- The operator BETWEEN may be used to check whether an attribute value is within a range of values.
--  For example, if you want to see a listing for all tickets whose prices are between €30 and €50, 
-- use the following command sequence: 

select * from ticket
where ticket_price between 30.00 and 50.00;


-- Write a query which displays the employee number, attraction no, the hours worked per attraction
--  and the date worked where the hours worked per attraction is between 5 and 10. 
--  Hint you will need to select data from the HOURS table.
--  The output for the query is shown in Figure 23


select emp_num,attract_no,hours_per_attract,date_worked
from HOURS
where hours_per_attract BETWEEN 5 and 10

select * from sales_line
WHERE TRANSACTION_NO IN (12781, 67593);

select * from ticket
where TICKET_TYPE in ('Adult', 'Child');

-- he LIKE operator is used to find patterns within string attributes. 
-- Standard SQL allows you to use the percent sign (%) and underscore (_) wildcard characters to make matches
-- when the entire string is not known. % means any and all following characters are eligible 
-- while _ means any one character may be substituted for the underscore

select emp_lname emp_fname, emp_num
from employee 
where emp_fname like 'A%';

select * from themepark
where park_name like '%land';