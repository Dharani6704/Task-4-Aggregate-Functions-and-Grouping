-- Create table: customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

-- Create table: orders
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE,
    total_amount NUMERIC(10,2)
);
-- Insert customers
INSERT INTO customers (name, city) VALUES
('Alice', 'New York'),
('Bob', 'Los Angeles'),
('Charlie', 'New York'),
('Diana', 'Chicago');

-- Insert orders
INSERT INTO orders (customer_id, order_date, total_amount) VALUES
(1, '2025-08-01', 250.00),
(1, '2025-08-03', 100.00),
(2, '2025-08-02', 300.00),
(3, '2025-08-01', 200.00),
(3, '2025-08-04', 150.00),
(4, '2025-08-05', 400.00);

--Aggregate functions with GROUPBY
--1. Total amount spent by each customer
SELECT 
    c.name,
    SUM(o.total_amount) AS total_spent
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.name;

--2. Number of orders per city
SELECT 
    c.city,
    COUNT(o.order_id) AS order_count
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.city;
--3. Average order value per customer
SELECT 
    c.name,
    AVG(o.total_amount) AS avg_order_value
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.name;

--Queries using HAVING
--4. Customers who spent more than 300 in total
SELECT 
    c.name,
    SUM(o.total_amount) AS total_spent
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.name
HAVING 
    SUM(o.total_amount) > 300;