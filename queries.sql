-- -----------------------------------------------------
-- Task 3: SQL for Data Analysis
-- Dataset: Simple Superstore-style sample
-- -----------------------------------------------------

-- 1. DROP TABLE IF EXISTS
DROP TABLE IF EXISTS orders;

-- 2. CREATE MAIN TABLE
CREATE TABLE orders (
    order_id VARCHAR(20),
    customer_id VARCHAR(20),
    product VARCHAR(50),
    category VARCHAR(30),
    quantity INT,
    price DECIMAL(10,2),
    order_date DATE
);

-- 3. INSERT DATA
INSERT INTO orders VALUES
('O001','C001','Laptop','Technology',1,50000,'2023-01-10'),
('O002','C002','Chair','Furniture',2,3000,'2023-01-12'),
('O003','C001','Mouse','Technology',3,800,'2023-01-15'),
('O004','C003','Notebook','Office Supplies',5,50,'2023-01-20'),
('O005','C004','Table','Furniture',1,7000,'2023-01-25');

-- -----------------------------------------------------
-- BASIC SQL QUERIES
-- -----------------------------------------------------

-- 4. SELECT: Retrieve all records
SELECT * FROM orders;

-- 5. WHERE: Filter Technology category
SELECT * FROM orders
WHERE category = 'Technology';

-- 6. ORDER BY: Sort by price (highest first)
SELECT * FROM orders
ORDER BY price DESC;

-- 7. GROUP BY: Total revenue by each category
SELECT category, SUM(price) AS total_revenue
FROM orders
GROUP BY category;

-- -----------------------------------------------------
-- JOIN QUERIES
-- -----------------------------------------------------

-- 8. CREATE CUSTOMER TABLE
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id VARCHAR(20),
    customer_name VARCHAR(50)
);

-- 9. INSERT CUSTOMER DATA
INSERT INTO customers VALUES
('C001','Rahul'),
('C002','Asha'),
('C003','John'),
('C004','Priya');

-- 10. INNER JOIN: Match orders with customer names
SELECT 
    o.order_id,
    c.customer_name,
    o.product,
    o.price
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- -----------------------------------------------------
-- SUBQUERY
-- -----------------------------------------------------

-- 11. Customers whose total spending is above the average price
SELECT customer_id, SUM(price) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > (SELECT AVG(price) FROM orders);

-- -----------------------------------------------------
-- VIEW CREATION
-- -----------------------------------------------------

-- 12. Create a view for category-wise total revenue
CREATE VIEW sales_summary AS
SELECT category, SUM(price) AS total_revenue
FROM orders
GROUP BY category;

-- 13. Select from the view
SELECT * FROM sales_summary;

-- -----------------------------------------------------
-- INDEX CREATION
-- -----------------------------------------------------

-- 14. Create index on order_date column
CREATE INDEX idx_order_date ON orders(order_date);

-- -----------------------------------------------------
-- END OF TASK 3 SQL
-- -----------------------------------------------------
