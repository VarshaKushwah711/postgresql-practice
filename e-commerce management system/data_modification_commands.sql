-- Adding an email column to the Customers table:
ALTER TABLE Customers
ADD email VARCHAR(100);

-- Changing the cust_name column to allow more characters:
ALTER TABLE Customers
ALTER COLUMN cust_name TYPE VARCHAR(100);

-- Removing the email column from the Customers table:
ALTER TABLE Customers
DROP COLUMN email;

-- Renaming cust_name to customer_name:
ALTER TABLE Customers
RENAME COLUMN cust_name TO customer_name;
