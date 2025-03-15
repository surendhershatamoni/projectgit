use sql_assigment;
select * from agents;
select * from customer;
select * from information;
select * from orders;
--- 1. Write a query to display all the agents name with their phone number from agents table. 
select agent_name,phone_number from agents; 

--- 2. Write a query to display the names of all the customers with working area is Leeds from customer table.
select cust_name
from customer
where working_area ='leeds';

--- 3. Write a query to display the order number and order amount with order description is shoes from orders table.
select order_num,order_amount,order_description
from orders
where order_description = 'shoe';
/*4. Write a query to display the agent code, order amount and order description where order 
amount= 3000 and order description is clothes:*/
select agent_code,order_amount,order_description
from orders
where order_amount ='3000'and order_description ='clothes';
  
--- 5. Write a query to display all the details from the table order where the order amount is more than 2000.
select * from orders
where order_amount >'2000';

--- 6.Write a query to display customer name and customer phone number that have alphabet ‘e’ in their name.
select cust_name,phone_number
from customer
where cust_name like '%e%';

--- 7. Write a query to display all the details from orders table with minimum order amount.
select distinct *  from orders
order by order_amount
limit 1 ;

select *
FROM orders
WHERE order_amount = (SELECT MIN(order_amount) FROM orders);

--- 8. Write a query to display the total order amount from orders table.
select sum(order_amount) as total_order_amount
from orders;

--- 9. Write a query to find the number of agents currently listing for all of their customers from orders table. 
select agent_code,agent_name,COUNT(DISTINCT customer_id) 
AS agent_currently_listing
from orders
group by agent_code, agent_name;

--- 10. Write a query to find the highest purchase amount ordered by the each customer code and highest order amount. 
select cust_code,(order_amount) as highest_purchase_amount
from orders
group by cust_code;

--- 11. Write a query to find the highest order amount on a date '2022-07-13' with agent code. 
select * from orders;
select agent_code, max(order_amount) as highest_order_amount
from orders
where order_date='2022-07-13'
group by agent_code
limit 1;

--- 12. Write a query to find the name and customer city of those customers and agents who work in the same city. 
select c.cust_name,c.cust_city,a.working_area
from customer c 
inner join agents a 
on c.cust_city=a.working_area;
--- 13. Write a query to find the name of all the customer names along with the agent name works for them.
--- their agents working area.
 select c.cust_name,a.agent_name,a.working_area
 as agent_work_place
 from customer c 
 join agents a
 on c.agent_code = a.agent_code;
 
--- 15. Write a query to display all the orders issued by the agent 'Rickey' from the orders table.
select * from orders o 
right join agents a 
on o.agent_code = a.agent_code
WHERE a.agent_name = 'Rickey';