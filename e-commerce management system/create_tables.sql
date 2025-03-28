CREATE TABLE Customers (
    cust_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(50) NOT NULL
);

CREATE TABLE Orders (
    ord_id SERIAL PRIMARY KEY,
    ord_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    cust_id INT REFERENCES Customers(cust_id)
);
