📘 Task 3 – SQL for Data Analysis
Internship Assignment – SQL Fundamentals
📌 Overview

This task demonstrates SQL skills using a simple Superstore-style dataset.
The goal is to show proficiency in:

SELECT

WHERE

ORDER BY

GROUP BY

JOINS

SUBQUERIES

Views

Index creation

This README contains instructions, dataset structure, SQL queries, and expected outputs.

🗂 Dataset Used

A simple sample dataset named orders was created manually to perform SQL operations.

orders table structure
Column	Type
order_id	VARCHAR(20)
customer_id	VARCHAR(20)
product	VARCHAR(50)
category	VARCHAR(30)
quantity	INT
price	DECIMAL
order_date	DATE
Sample data inserted
order_id	customer_id	    product	    category	    quantity	price	 order_date
O001	     C001	        Laptop	    Technology	    1	        50000	 2023-01-10
O002	     C002	        Chair	    Furniture	    2	        3000	 2023-01-12
O003	     C001	        Mouse	    Technology	    3	        800	     2023-01-15
O004	     C003	        Notebook	Office Supplies	5	        50	     2023-01-20
O005	     C004	        Table	    Furniture	    1	        7000	 2023-01-25

The dataset is small but valid for demonstrating all SQL concepts required in Task 3.

🛠 SQL Queries Implemented

Below are the SQL tasks performed as per assignment requirements.

1️⃣ SELECT Query
SELECT * FROM orders;


Purpose: Retrieve all rows from the table.

2️⃣ WHERE Query
SELECT * FROM orders
WHERE category = 'Technology';


Purpose: Filter records based on a condition.

3️⃣ ORDER BY Query
SELECT * FROM orders
ORDER BY price DESC;


Purpose: Sort results in descending order of price.

4️⃣ GROUP BY + Aggregate
SELECT category, SUM(price) AS total_revenue
FROM orders
GROUP BY category;


Purpose: Summarize revenue by category.

5️⃣ JOIN Query

We created a simple customers table:

CREATE TABLE customers (
    customer_id VARCHAR(20),
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
('C001','Rahul'),
('C002','Asha'),
('C003','John'),
('C004','Priya');


Join query:

SELECT o.order_id, c.customer_name, o.product, o.price
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;


Purpose: Combine order information with customer details.

6️⃣ SUBQUERY Example
SELECT customer_id, SUM(price) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > (
    SELECT AVG(price) FROM orders
);


Purpose: Identify customers spending above the average order value.

7️⃣ CREATE VIEW
CREATE VIEW sales_summary AS
SELECT category, SUM(price) AS total_revenue
FROM orders
GROUP BY category;


Purpose: Create a reusable summary dataset.

8️⃣ INDEX (Performance Optimization)
CREATE INDEX idx_order_date ON orders(order_date);


Purpose: Improve query performance on date filtering.

🖼 Screenshots

The outputs of each query were executed using:

👉 OneCompiler MySQL: https://onecompiler.com/mysql

Screenshots include:

SELECT results

WHERE results

ORDER BY results

GROUP BY summary

JOIN output

Subquery results

View output

Index creation