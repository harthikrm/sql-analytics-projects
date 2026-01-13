/*
Objective:
Analyze transactional order data to understand revenue trends, customer contribution, and product category performance.

Dataset:
orders table (see README for schema)

Assumptions:
- Each row represents a single order-level transaction
- Revenue is net of discounts and returns
- order_date reflects the purchase date
*/
  
-- Business Question:
-- Which product categories contribute the most to total revenue?
  
-- Expected Output:
-- One row per product category with total revenue, sorted from highest to lowest.
  
SELECT product_category, sum(revenue) AS total_revenue
FROM orders
GROUP BY product_category
ORDER BY total_revenue DESC;

-- Business Question:
-- How does total revenue trend over time on a monthly basis?

-- Expected Output:
-- One row per month with aggregated revenue, sorted chronologically.

SELECT DATE_TRUNC('month', order_date) as month, sum(revenue) as total_revenue
FROM orders
GROUP BY month
ORDER BY month ASC;

-- Business Question:
-- Which customers contribute the highest total revenue?

-- Expected Output:
-- Top 10 customers ranked by total revenue in descending order.

SELECT customer_id, sum(revenue) as total_revenue
FROM orders
GROUP BY customer_id
ORDER BY total_revenue DESC
LIMIT 10;

-- Business Question:
-- What is the average revenue per order across all transactions?

-- Expected Output:
-- A single row showing the average order value.

SELECT avg(revenue) as average_order_value
FROM orders;

-- Business Question:
-- Which orders generated revenue greater than the overall average order value?

-- Expected Output:
-- One row per qualifying order with order_id and revenue.

SELECT order_id, revenue
FROM orders
WHERE revenue > (SELECT avg(revenue) FROM orders);





  
