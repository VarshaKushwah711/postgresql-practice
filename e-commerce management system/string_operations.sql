-- Combine first and last names (assuming a last_name field exists):
SELECT CONCAT(cust_name, ' - Customer') AS customer_info
FROM Customers;

-- Concatenate with a separator:
SELECT CONCAT_WS(', ', cust_name, 'Customer ID: ' || cust_id) AS customer_info
FROM Customers;

-- Get the first three characters of each customer name:
SELECT SUBSTRING(cust_name FROM 1 FOR 3) AS short_name
FROM Customers;

-- Get the first 4 characters of each customer name:
SELECT LEFT(cust_name, 4) AS left_name
FROM Customers;

-- Get the last 4 characters of each customer name:
SELECT RIGHT(cust_name, 4) AS right_name
FROM Customers;

-- Replace "Sharma" with "Singh" in customer names:
SELECT REPLACE(cust_name, 'Sharma', 'Singh') AS updated_name
FROM Customers;

-- Reverse the customer names:
SELECT REVERSE(cust_name) AS reversed_name
FROM Customers;

-- Remove spaces from the customer names (useful if there are leading/trailing spaces):
SELECT TRIM(cust_name) AS trimmed_name
FROM Customers;

-- Get the length of each customer name:
SELECT cust_name, LENGTH(cust_name) AS name_length
FROM Customers;

-- Find the position of 'a' in each customer name:
SELECT cust_name, POSITION('a' IN cust_name) AS position_of_a
FROM Customers;
