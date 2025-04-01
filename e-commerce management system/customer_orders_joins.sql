-- Retrieve the names of all customers along with their corresponding orders:
SELECT Customers.cust_name, Orders.ord_date, Orders.amount 
FROM Customers 
INNER JOIN Orders ON Customers.cust_id = Orders.cust_id;


-- List all customers and their orders, including customers who haven't placed any orders.
SELECT Customers.cust_name, Orders.ord_date, Orders.amount 
FROM Customers 
LEFT JOIN Orders ON Customers.cust_id = Orders.cust_id;


-- Find all orders along with customer names, including orders that don't have a corresponding customer.
SELECT Customers.cust_name, Orders.ord_date, Orders.amount 
FROM Customers 
RIGHT JOIN Orders ON Customers.cust_id = Orders.cust_id;


-- Get a complete list of customers and orders, showing all customers and all orders, even if they don't match.
SELECT Customers.cust_name, Orders.amount 
FROM Customers 
FULL OUTER JOIN Orders ON Customers.cust_id = Orders.cust_id;

--Calculate the total amount spent by each customer. Display customer names along with their total spending.
select Customers.cust_name, SUM(amount) as total_bill
from Customers
Inner join orders 
on customers.cust_id = orders.cust_id
group by customers.cust_name;


--Get a list of customers who have not placed any orders.
select Customers.cust_name, Orders.ord_date, Orders.amount 
from customers
left join orders
on customers.cust_id = orders.cust_id
where Orders.ord_id is null;


--count how many orders each customer has placed.
select Customers.cust_name, count(Orders.ord_id) as order_count
from Customers
Left join Orders
on Customers.cust_id = orders.cust_id
group by Customers.cust_name;


-- Retrieve names of customers who have spent more than Rs.500 in total.
select Customers.cust_name, sum(orders.amount) as total_amount
from Customers
Inner join Orders
on Customers.cust_id = Orders.cust_id
group by Customers.cust_name
having sum(orders.amount) > 500;

-- Get the most recent order date for each customer.
select Customers.cust_name, Max(Orders.ord_date) as latest_order_date
from Customers
Inner join Orders
on Customers.cust_id = Orders.cust_id
group by Customers.cust_name;

--Calculate the average order amount for each customer.
select Customers.cust_name , AVG(Orders.amount) as avrage_amount
from Customers
Inner join Orders
on Customers.cust_id = Orders.cust_id
Group by Customers.cust_name;


--Identify the customer who has spent the most in total.
select c.cust_name, sum(o.amount) as total_spent
from Customers c
inner join Orders o
On c.cust_id = o.cust_id
group by c.cust_name
order by total_spent desc
limit 1;

--Identify the customer who has spent the second highest in total.
select c.cust_name, sum(o.amount) as total_spent
from Customers c
inner join Orders o
On c.cust_id = o.cust_id
group by c.cust_name
order by total_spent desc
limit 1
offset 1;

--Count how many orders were placed each month.
select c.cust_name , EXtract(year from O.ord_date) as order_year,
Extract(month from O.ord_date) as order_month
from customers c
inner join Orders o
on c.cust_id = o.cust_id
group by c.cust_name , order_year, order_month
order by order_year, order_month, c.cust_name;


-- Retrieve names of customers who placed orders between two specific dates.
select c.cust_name, o.ord_date
from Customers c
inner join Orders o
on c.cust_id = o.cust_id
where o.ord_date between '2024-01-01' and '2024-02-01';

--Generate a summary that includes customer name, number of orders, and total spent.
select c.cust_name ,count(o.ord_id) as number_of_orders,
sum(o.amount) as total_spent
from Customers c
inner join Orders o
on c.cust_id = o.cust_id
group by c.cust_name
order by total_spent desc;


--: Find any customers who have the same name in the Customers table.
select cust_name, count(*) as name_count
from Customers
group by cust_name
having count(*) > 1;

-- List all orders along with customer names, sorted by customer names alphabetically.
select c.cust_name , o.ord_date, o.amount
from Customers c
inner join Orders o
on c.cust_id = o.cust_id
order by c.cust_name;


--Compute the total revenue generated from all orders.
select sum(amount) as total_revenue from Orders;

select * from orders;

--Retrieve names of customers who placed orders on '2024-01-10'.
select c.cust_name from Customers c
inner join Orders o
on c.cust_id = o.cust_id
where o.ord_date = '2024-05-23';




--You need to display all customers and their orders, whether they have placed an order or not.
select c.cust_name, o.ord_date, o.amount from Customers c
full join Orders o
On c.cust_id = o.cust_id;


--You want to combine all customers with all orders, meaning you need to show every combination of each customer with every order.
select c.cust_name, o.ord_date , o.amount from Customers c
cross join Orders o;

