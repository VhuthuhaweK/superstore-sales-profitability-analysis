-- WEEK 3 — SUPERSTORE SQLITE DATABASE SCHEMA
-- Prepared by: Khorombi Vhuthuhawe

DROP TABLE IF EXISTS superstore;

CREATE TABLE superstore (
    order_id TEXT,
    order_date TEXT,
    ship_date TEXT,
    ship_mode TEXT,
    customer_id TEXT,
    customer_name TEXT,
    segment TEXT,
    country TEXT,
    city TEXT,
    state TEXT,
    postal_code TEXT,
    region TEXT,
    product_id TEXT,
    category TEXT,
    sub_category TEXT,
    product_name TEXT,
    sales REAL,
    quantity INTEGER,
    discount REAL,
    profit REAL
);

-- After creating the table, import superstore_cleaned.csv.
--
-- SQLite CLI example:
-- .mode csv
-- .headers on
-- .import superstore_cleaned.csv superstore
--
-- Then verify:
-- SELECT COUNT(*) FROM superstore;
