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
