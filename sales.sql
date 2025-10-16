-- TOTAL RECORDS OR ROWS IN TABLE
SELECT COUNT(*) FROM sales.transactions;
SELECT COUNT(*) FROM sales.customers;
SELECT COUNT(*) FROM sales.markets;
SELECT COUNT(*) FROM sales.products;

-- 1st 5 rows of transactions table
SELECT * FROM sales.transactions LIMIT 5;

-- All data from transactions table where market is Chennai.
SELECT * FROM sales.transactions WHERE market_code = "Mark001";

-- How many records are there in Channai market.
SELECT COUNT(*) FROM sales.transactions WHERE market_code = "Mark001";

-- All data from transaction table where curreny is USD.
SELECT * FROM sales.transactions WHERE currency = "USD";


SELECT * FROM sales.transactions LIMIT 5;

-- All data of transactions and date table of year 2020
SELECT sales.transactions.*,
sales.date.*
FROM sales.transactions
INNER JOIN sales.date
on sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020;

-- Total revenue of year 2020
SELECT SUM(sales.transactions.sales_amount)
FROM sales.transactions
INNER JOIN sales.date
ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020;

-- Total revenue of year 2019
SELECT SUM(sales.transactions.sales_amount)
FROM sales.transactions
INNER JOIN sales.date
ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2019;

-- Total Revenue of year 2020 in Chennai.
SELECT SUM(sales.transactions.sales_amount)
FROM sales.transactions
INNER JOIN sales.date
ON sales.transactions.order_date = sales.date.date
WHERE sales.date.year = 2020 AND sales.transactions.market_code = "Mark001";

-- Distinct products in Chennai
SELECT DISTINCT product_code FROM sales.transactions WHERE market_code = "Mark001";

-- In transaction table how many sales amount is less than or equal to 0.
SELECT * FROM sales.transactions WHERE sales_amount <= 0;

-- Total number of records for sales amount <= 0 
SELECT COUNT(*) FROM sales.transactions WHERE sales_amount <=0;

USE sales;

SELECT DISTINCT currency FROM transactions;

-- 'INR' = 279 RECORDS
-- 'USD' = 2 RECORDS
-- 'INR\r' = '150000' RECORDS
-- 'USD\r' = 2 RECORDS

-- /r Character means new line 

SELECT * FROM transactions WHERE currency = 'INR';
SELECT COUNT(currency) FROM transactions WHERE currency = "INR";

SELECT * FROM transactions WHERE currency = 'INR\r';
SELECT COUNT(currency) FROM transactions WHERE currency = 'INR\r';


SELECT * FROM transactions WHERE currency = 'USD';

SELECT * FROM transactions WHERE currency = 'USD\r';

SELECT * FROM transactions WHERE currency = 'USD' or currency = 'USD\r';

-- NOW WE NEED TO KEEP RECORDS THAT HAVE /r CHARACTER.

-- To check the total revenue of year 2020
SELECT SUM(transactions.sales_amount)
FROM transactions INNER JOIN date
ON transactions.order_date = date.date
WHERE date.year = 2020 AND (transactions.currency = 'INR/r' OR transactions.currency = 'USD/r');

SELECT SUM(transactions.sales_amount)
FROM transactions INNER JOIN date
ON transactions.order_date = date.date
WHERE date.year = 2020 AND date.month_name = "january";
