-- Retrieve a list of customer names and order dates. Ensure that there are no duplicates in the result.
SELECT cust_name AS name FROM Customers
UNION
SELECT ord_date::text FROM Orders;

-- List the order amounts and customer names together in one result set, without duplicates.
SELECT cust_name AS name FROM Customers
UNION 
SELECT amount::text FROM Orders;

-- List the order amounts and customer names together, including duplicates.
SELECT cust_name AS name FROM Customers
UNION ALL 
SELECT amount::text AS name FROM Orders;

-- List the order amounts and customer names together in one result set, without duplicates.
SELECT amount::text FROM Orders
UNION 
SELECT cust_name FROM Customers;

-- Find customer names that match with any order amounts (assuming names are in some formatted string of numbers).
SELECT cust_name FROM Customers
INTERSECT
SELECT amount::text FROM Orders;

-- List the names of customers who also have order amounts equal to specific values (e.g., 250.00 and 300.00).
SELECT cust_name FROM Customers
WHERE cust_id IN (SELECT cust_id FROM Orders WHERE amount IN (250.00, 300.00))
INTERSECT
SELECT cust_name FROM Customers WHERE cust_id IN (SELECT cust_id FROM Orders);

-- List customer names that have not placed any orders.
SELECT c.cust_name FROM Customers c
LEFT JOIN Orders o ON c.cust_id = o.cust_id
WHERE o.amount IS NULL;

-- List customer names that have not placed any orders using EXCEPT.
SELECT cust_name FROM Customers
EXCEPT 
SELECT c.cust_name FROM Customers c
JOIN Orders o ON c.cust_id = o.cust_id;

-- Retrieve the order amounts that are not linked to any customer (if any).
SELECT amount FROM Orders
EXCEPT 
SELECT o.amount FROM Orders o
JOIN Customers c ON o.cust_id = c.cust_id;
