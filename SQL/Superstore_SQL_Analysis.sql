-- ============================================================
-- WEEK 3: SQL FOR DATA ANALYSIS
-- Superstore Dataset
-- Prepared by: Khorombi Vhuthuhawe
-- Internship: NexAfrica Data Analysis Internship
-- Database: SQLite
-- ============================================================

-- IMPORTANT:
-- This file assumes the cleaned Superstore data has been loaded
-- into a table called: superstore
--
-- Column names expected:
-- order_id, order_date, ship_date, ship_mode, customer_id,
-- customer_name, segment, country, city, state, postal_code,
-- region, product_id, category, sub_category, product_name,
-- sales, quantity, discount, profit
--
-- The Week 1 cleaning process standardised the column names and
-- converted the date fields to datetime before export.

-- ============================================================
-- SECTION 1: BASIC DATA CHECK
-- ============================================================

-- Q1. How many records are in the dataset?
SELECT COUNT(*) AS total_records
FROM superstore;

-- Q2. How many unique orders, customers and products are represented?
SELECT
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(DISTINCT product_id) AS unique_products
FROM superstore;


-- ============================================================
-- SECTION 2: SELECT, SUM, COUNT, AVG, MIN AND MAX
-- ============================================================

-- Q3. What are the overall sales, profit and quantity?
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity,
    AVG(sales) AS average_sales,
    AVG(profit) AS average_profit,
    MIN(sales) AS minimum_sales,
    MAX(sales) AS maximum_sales
FROM superstore;


-- ============================================================
-- SECTION 3: CATEGORY ANALYSIS
-- ============================================================

-- Q4. Which categories generate the most sales and profit?
SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(discount) AS average_discount,
    (SUM(profit) / NULLIF(SUM(sales), 0)) * 100 AS profit_margin
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


-- Q5. Which category has the highest average profit per transaction?
SELECT
    category,
    AVG(profit) AS average_profit
FROM superstore
GROUP BY category
ORDER BY average_profit DESC;


-- ============================================================
-- SECTION 4: SUB-CATEGORY ANALYSIS
-- ============================================================

-- Q6. Which sub-categories are the most and least profitable?
SELECT
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / NULLIF(SUM(sales), 0)) * 100 AS profit_margin
FROM superstore
GROUP BY sub_category
ORDER BY total_profit ASC;


-- Q7. Which sub-categories have total losses?
-- HAVING is used to filter aggregated results.
SELECT
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


-- ============================================================
-- SECTION 5: DISCOUNT ANALYSIS
-- ============================================================

-- Q8. How does profitability vary by discount level?
SELECT
    discount,
    COUNT(*) AS transaction_count,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(profit) AS average_profit,
    (SUM(profit) / NULLIF(SUM(sales), 0)) * 100 AS profit_margin
FROM superstore
GROUP BY discount
ORDER BY discount ASC;


-- Q9. Which discount levels produce a total loss?
SELECT
    discount,
    COUNT(*) AS transaction_count,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY discount
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


-- Q10. Which transactions received a discount of 40%?
SELECT
    order_id,
    order_date,
    state,
    region,
    product_name,
    sales,
    discount,
    profit
FROM superstore
WHERE discount = 0.40
ORDER BY profit ASC;


-- ============================================================
-- SECTION 6: REGIONAL ANALYSIS
-- ============================================================

-- Q11. Which regions generate the most sales and profit?
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / NULLIF(SUM(sales), 0)) * 100 AS profit_margin
FROM superstore
GROUP BY region
ORDER BY total_profit DESC;


-- Q12. Which states are loss-making overall?
SELECT
    state,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / NULLIF(SUM(sales), 0)) * 100 AS profit_margin
FROM superstore
GROUP BY state
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


-- ============================================================
-- SECTION 7: TABLES DEEP-DIVE
-- ============================================================

-- Q13. How is the Tables sub-category performing by discount?
SELECT
    discount,
    COUNT(*) AS transaction_count,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / NULLIF(SUM(sales), 0)) * 100 AS profit_margin
FROM superstore
WHERE sub_category = 'Tables'
GROUP BY discount
ORDER BY discount ASC;


-- Q14. Which Tables products have the largest losses?
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(discount) AS average_discount
FROM superstore
WHERE sub_category = 'Tables'
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;


-- Q15. Which regions are loss-making for Tables?
SELECT
    region,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / NULLIF(SUM(sales), 0)) * 100 AS profit_margin
FROM superstore
WHERE sub_category = 'Tables'
GROUP BY region
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;


-- ============================================================
-- SECTION 8: EAST REGION TABLES INVESTIGATION
-- ============================================================

-- Q16. Which East-region states have the lowest Tables profit?
SELECT
    state,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / NULLIF(SUM(sales), 0)) * 100 AS profit_margin
FROM superstore
WHERE sub_category = 'Tables'
  AND region = 'East'
GROUP BY state
ORDER BY total_profit ASC;


-- Q17. How does discount relate to profit for East-region Tables?
SELECT
    discount,
    COUNT(*) AS transaction_count,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(profit) AS average_profit,
    (SUM(profit) / NULLIF(SUM(sales), 0)) * 100 AS profit_margin
FROM superstore
WHERE sub_category = 'Tables'
  AND region = 'East'
GROUP BY discount
ORDER BY discount ASC;


-- Q18. What happens at 40% discount in New York, Ohio and Pennsylvania?
SELECT
    state,
    COUNT(*) AS records,
    COUNT(DISTINCT order_id) AS unique_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    (SUM(profit) / NULLIF(SUM(sales), 0)) * 100 AS profit_margin
FROM superstore
WHERE sub_category = 'Tables'
  AND region = 'East'
  AND state IN ('New York', 'Ohio', 'Pennsylvania')
  AND discount = 0.40
GROUP BY state
ORDER BY total_profit ASC;


-- ============================================================
-- SECTION 9: PRODUCT ANALYSIS
-- ============================================================

-- Q19. Which products have the highest sales?
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;


-- Q20. Which products are loss-making?
SELECT
    product_name,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(discount) AS average_discount
FROM superstore
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 10;


-- ============================================================
-- SECTION 10: DATE / TIME ANALYSIS
-- ============================================================

-- SQLite date functions are used here because the database is SQLite.

-- Q21. What are yearly sales and profit?
SELECT
    strftime('%Y', order_date) AS order_year,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY strftime('%Y', order_date)
ORDER BY order_year;


-- Q22. What are monthly sales and profit?
SELECT
    strftime('%Y-%m', order_date) AS order_month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore
GROUP BY strftime('%Y-%m', order_date)
ORDER BY order_month;


-- ============================================================
-- SECTION 11: MIN / MAX EXAMPLES
-- ============================================================

-- Q23. What are the minimum and maximum values for sales and profit?
SELECT
    MIN(sales) AS minimum_sales,
    MAX(sales) AS maximum_sales,
    MIN(profit) AS minimum_profit,
    MAX(profit) AS maximum_profit,
    MIN(discount) AS minimum_discount,
    MAX(discount) AS maximum_discount
FROM superstore;


-- ============================================================
-- SECTION 12: OPTIONAL JOIN EXAMPLE
-- ============================================================

-- The original Superstore dataset is supplied as one transaction table,
-- so a JOIN is not necessary for the core analysis.
--
-- If the data is normalised into separate tables, the following JOIN
-- demonstrates how product information could be combined with sales:
--
-- SELECT
--     p.category,
--     p.sub_category,
--     SUM(s.sales) AS total_sales,
--     SUM(s.profit) AS total_profit
-- FROM sales s
-- JOIN products p
--     ON s.product_id = p.product_id
-- GROUP BY p.category, p.sub_category
-- ORDER BY total_profit DESC;
--
-- This JOIN is appropriate only after the dataset has been split into
-- related tables such as sales and products.


-- ============================================================
-- END OF WEEK 3 SQL ANALYSIS
-- ============================================================
