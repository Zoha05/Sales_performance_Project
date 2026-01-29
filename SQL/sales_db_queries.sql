CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name TEXT,
    gender TEXT,
    age INT,
    income_segment TEXT,
    loyalty_status TEXT
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    cost_price FLOAT
);

CREATE TABLE regions (
    region_id INT PRIMARY KEY,
    region TEXT,
    country TEXT
);

CREATE TABLE sales_transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    region_id INT,
    channel TEXT,
    order_date DATE,
    quantity INT,
    unit_price FLOAT,
    discount FLOAT,
    revenue FLOAT
);

--COUNT
SELECT COUNT(*) FROM sales_transactions;

--SUM REVENUE
SELECT SUM(revenue) AS total_revenue FROM sales_transactions;

-- Revenue by Region
SELECT r.region, SUM(s.revenue) AS revenue
FROM sales_transactions s
JOIN regions r ON s.region_id = r.region_id
GROUP BY r.region
ORDER BY revenue DESC;

-- Top 10 Products
SELECT p.product_name, SUM(s.revenue) AS revenue
FROM sales_transactions s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10;

-- Channel Performance
SELECT channel, SUM(revenue) AS revenue
FROM sales_transactions
GROUP BY channel;

--MONTHLY REVENUE TREND
SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(revenue) AS revenue
FROM sales_transactions
GROUP BY month
ORDER BY month;


