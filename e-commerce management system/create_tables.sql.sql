create table Customers(
	cust_id SERIAL primary key,
	cust_name varchar(50) not null
);

create table Orders(
	ord_id serial primary key,
	ord_date date not null,
	amount decimal(10,2) not null,
	cust_id int references Customers(cust_id)
);


insert into Customers(cust_name) values
('Varsha kushwah'),('Tripti patel'),('Prerna sharma'), ('Kanita verma'),('Saloni Rajput'),('Mansi chouhan'),
('Shivani mathe'),('Diksha verma'),('Renuka jain'),('Sonali choudhary'),('Rahul sharma');

insert into Customers(cust_name) values ('Deepak sen'),('Shital bercha');

select * from Customers;


INSERT INTO Orders (ord_date, amount, cust_id) VALUES
('2024-01-02', 250.00, 1),
('2024-01-13', 150.50, 3),
('2024-01-04', 200.75, 2),
('2024-02-05', 300.00, 4),
('2024-02-26', 175.25, 5),
('2024-03-07', 225.00, 1),
('2024-03-08', 120.00, 6),
('2024-03-19', 400.00, 2),
('2024-04-1', 350.50, 7),
('2024-04-11', 275.75, 8),
('2024-04-25',434.54,6),
('2024-04-12', 300.25, 9),
('2024-05-13', 180.00, 3),
('2024-05-14', 220.00, 5),
('2024-05-15', 275.00, 10),
('2024-05-16', 300.00, 4);

insert into orders (ord_date, amount, cust_id) VALUES
('2024-05-21', 760.00, 1),
('2024-05-23', 990.50, 1);

select * from orders;

------------------------- Joins --------------------------------------

--Retrieve the names of all customers along with their corresponding orders:
select Customers.cust_name, Orders.ord_date, Orders.amount from Customers 
Inner join Orders
on Customers.cust_id = orders.cust_id;

--List all customers and their orders, including customers who haven't placed any orders.
select Customers.cust_name, Orders.ord_date, Orders.amount from Customers
Left join Orders
On Customers.cust_id = Orders.cust_id;


--Find all orders along with customer names, including orders that don't have a corresponding customer.
select Customers.cust_name, Orders.ord_date, Orders.amount
from Customers Right join Orders 
On Customers.cust_id = Orders.cust_id;


--Get a complete list of customers and orders, showing all customers and all orders, even if they don't match.
select Customers.cust_name , Orders.amount from Customers
Full Outer Join Orders
on customers.cust_id = orders.cust_id;




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


------------------------------------SET--------------------------------------------


--Retrieve a list of customer names and order dates. Ensure that there are no duplicates in the result.
SELECT cust_name AS name FROM Customers
UNION
SELECT ord_date::text FROM Orders;

--List the order amounts and customer names together in one result set, without duplicates.
SELECT cust_name as name from Customers
UNION 
SELECT amount::text from Orders;

select cust_name as name from Customers
union all 
select amount :: text as name from Orders;

select * from orders;
select * from Customers;

-- List the order amounts and customer names together in one result set, without duplicates.
select amount::text from Orders
union 
select cust_name from Customers;

-- Find customer names that match with any order amounts (assuming names are in some formatted string of numbers).
select cust_name from Customers
intersect
select amount :: text from orders;


-- List the names of customers who also have order amounts equal to specific values (e.g., 250.00 and 300.00).
select cust_name from customers
where cust_id In (select cust_id from Orders where amount In (250.00,300.00))
intersect
select cust_name from customers where cust_id In(select cust_id from Orders);


-- List customer names that have not placed any orders.
select c.cust_name from customers c
left join orders o
on c.cust_id = o.cust_id
where o.amount is null;

select cust_name from customers
except 
select c.cust_name from customers c
join orders o
on c.cust_id = o.cust_id;


-- Retrieve the order amounts that are not linked to any customer (if any).
select amount from Orders
except 
select o.amount from Orders o
join customers c
on o.cust_id = c.cust_id;
