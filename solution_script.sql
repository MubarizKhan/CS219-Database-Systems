
#		Question No. 1

# 1.

select REGION_NAME, COUNT(COUNTRY_NAME) FROM regions, countries where
 regions.REGION_ID = countries.REGION_ID;

 # 2.

 select customers.CUSTOMER_ID, NAME, ORDER_ID FROM customers, orders where 
 customers.CUSTOMER_ID = orders.CUSTOMER_ID and ORDER_DATE <= "2017-1-1"
  order by customers.CUSTOMER_ID desc;

 # 3.

select CUSTOMER_ID, NAME FROM customers where NAME LIKE "Co%";

# 4. check please

select DISTINCT(products.PRODUCT_ID), PRODUCT_NAME, LIST_PRICE FROM products, order_items where 
products.PRODUCT_ID != order_items.PRODUCT_ID order by LIST_PRICE desc;

# 5.

select  WAREHOUSES.WAREHOUSE_NAME ,  sum(PRODUCTS.LIST_PRICE) as price
from WAREHOUSES
inner join INVENTORIES ON
WAREHOUSES.WAREHOUSE_ID = INVENTORIES.WAREHOUSE_ID
inner join PRODUCTS ON
INVENTORIES.PRODUCT_ID = PRODUCTS.PRODUCT_ID
GROUP by WAREHOUSES.WAREHOUSE_NAME
order by price DESC;


# 6. check please

select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, COUNT(SALESMAN_ID) from employees, orders where
EMPLOYEE_ID = SALESMAN_ID order by count(SALESMAN_ID) desc;

