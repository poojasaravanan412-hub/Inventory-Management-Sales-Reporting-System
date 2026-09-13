-- USE Inventory_MIS;
-- DESCRIBE categories;
-- DESCRIBE products;
-- DESCRIBE suppliers;
-- DESCRIBE purchases;
-- DESCRIBE sales;

-- R1: Category-wise Product Count

-- SELECT
--     c.Category_Name,
--     COUNT(p.Product_ID) AS Product_Count
-- FROM categories c
-- JOIN products p
--     ON c.Category_ID = p.Category_ID
-- GROUP BY c.Category_ID, c.Category_Name
-- ORDER BY Product_Count DESC;

-- R2: Top 5 Suppliers by Product Count

-- SELECT
--     s.Supplier_Name,
--     COUNT(p.Product_ID) AS Product_Count
-- FROM suppliers s
-- JOIN products p
--     ON s.Supplier_ID = p.Supplier_ID
-- GROUP BY s.Supplier_ID, s.Supplier_Name
-- ORDER BY Product_Count DESC
-- LIMIT 5;

-- R3: Monthly Total Purchased Quantity

-- SELECT
--     MONTHNAME(Purchase_Date) AS Month_Name,
--     MONTH(Purchase_Date) AS Month_Number,
--     SUM(Quantity) AS Total_Purchased
-- FROM purchases
-- GROUP BY MONTH(Purchase_Date), MONTHNAME(Purchase_Date)
-- ORDER BY Month_Number;

-- SELECT SUM(Quantity) AS Grand_Total
-- FROM purchases;

-- R4: Monthly Total Sold Quantity

-- SELECT
--     MONTHNAME(Sales_Date) AS Month_Name,
--     MONTH(Sales_Date) AS Month_Number,
--     SUM(Quantity) AS Total_Sold
-- FROM sales
-- GROUP BY
--     MONTH(Sales_Date),
--     MONTHNAME(Sales_Date)
-- ORDER BY
--     Month_Number;

-- SELECT
--     SUM(Quantity) AS Grand_Total
-- FROM sales;

-- R5: Top 10 Products by Current Stock

-- SELECT
--     p.Product_Name,
--     COALESCE(purchased.Total_Purchased, 0)
--     - COALESCE(sold.Total_Sold, 0) AS Current_Stock
-- FROM products p

-- LEFT JOIN
-- (
--     SELECT
--         Product_ID,
--         SUM(Quantity) AS Total_Purchased
--     FROM purchases
--     GROUP BY Product_ID
-- ) purchased
--     ON p.Product_ID = purchased.Product_ID

-- LEFT JOIN
-- (
--     SELECT
--         Product_ID,
--         SUM(Quantity) AS Total_Sold
--     FROM sales
--     GROUP BY Product_ID
-- ) sold
--     ON p.Product_ID = sold.Product_ID

-- ORDER BY Current_Stock DESC
-- LIMIT 10;

-- R6: Top 5 Selling Products

-- SELECT
--     p.Product_Name,
--     SUM(s.Quantity) AS Total_Sold
-- FROM products p
-- JOIN sales s
--     ON p.Product_ID = s.Product_ID
-- GROUP BY p.Product_ID, p.Product_Name
-- ORDER BY Total_Sold DESC
-- LIMIT 5;

-- SELECT SUM(Quantity) AS Grand_Total_Sold
-- FROM sales;

-- R6: Top 5 Selling Products

-- SELECT
--     p.Product_Name,
--     SUM(s.Quantity) AS Total_Sold
-- FROM products p
-- JOIN sales s
--     ON p.Product_ID = s.Product_ID
-- GROUP BY p.Product_ID, p.Product_Name
-- ORDER BY Total_Sold DESC
-- LIMIT 5;



-- -- R7: Top 10 Most Expensive Products

-- SELECT
--     Product_Name,
--     Unit_Price
-- FROM products
-- ORDER BY Unit_Price DESC
-- LIMIT 10;


-- -- R8: Top 10 Cheapest Products

-- SELECT
--     Product_Name,
--     Unit_Price
-- FROM products
-- ORDER BY Unit_Price ASC
-- LIMIT 10;


-- -- R9: Products Below Reorder Level

-- SELECT
--     p.Product_Name,
--     p.Reorder_Level,
--     COALESCE(purchased.Total_Purchased, 0)
--     - COALESCE(sold.Total_Sold, 0) AS Current_Stock
-- FROM products p

-- LEFT JOIN
-- (
--     SELECT
--         Product_ID,
--         SUM(Quantity) AS Total_Purchased
--     FROM purchases
--     GROUP BY Product_ID
-- ) purchased
--     ON p.Product_ID = purchased.Product_ID

-- LEFT JOIN
-- (
--     SELECT
--         Product_ID,
--         SUM(Quantity) AS Total_Sold
--     FROM sales
--     GROUP BY Product_ID
-- ) sold
--     ON p.Product_ID = sold.Product_ID

-- WHERE
--     COALESCE(purchased.Total_Purchased, 0)
--     - COALESCE(sold.Total_Sold, 0) <= p.Reorder_Level

-- ORDER BY Current_Stock ASC;


-- -- R10: Top 10 Products by Inventory Value

-- SELECT
--     p.Product_Name,
--     (
--         COALESCE(purchased.Total_Purchased, 0)
--         - COALESCE(sold.Total_Sold, 0)
--     ) AS Current_Stock,
--     p.Unit_Price,
--     (
--         (
--             COALESCE(purchased.Total_Purchased, 0)
--             - COALESCE(sold.Total_Sold, 0)
--         ) * p.Unit_Price
--     ) AS Inventory_Value
-- FROM products p

-- LEFT JOIN
-- (
--     SELECT
--         Product_ID,
--         SUM(Quantity) AS Total_Purchased
--     FROM purchases
--     GROUP BY Product_ID
-- ) purchased
--     ON p.Product_ID = purchased.Product_ID

-- LEFT JOIN
-- (
--     SELECT
--         Product_ID,
--         SUM(Quantity) AS Total_Sold
--     FROM sales
--     GROUP BY Product_ID
-- ) sold
--     ON p.Product_ID = sold.Product_ID

-- ORDER BY Inventory_Value DESC
-- LIMIT 10;


-- -- R11: Monthly Inventory Value Trend

-- SELECT
--     Month_Name,
--     Month_Number,
--     SUM(Net_Inventory_Value) AS Inventory_Value
-- FROM
-- (
--     -- Purchased inventory value
--     SELECT
--         MONTHNAME(pu.Purchase_Date) AS Month_Name,
--         MONTH(pu.Purchase_Date) AS Month_Number,
--         SUM(pu.Quantity * p.Unit_Price) AS Net_Inventory_Value
--     FROM purchases pu
--     JOIN products p
--         ON pu.Product_ID = p.Product_ID
--     GROUP BY
--         MONTH(pu.Purchase_Date),
--         MONTHNAME(pu.Purchase_Date)

--     UNION ALL

--     -- Sold inventory value
--     SELECT
--         MONTHNAME(s.Sales_Date) AS Month_Name,
--         MONTH(s.Sales_Date) AS Month_Number,
--         -SUM(s.Quantity * p.Unit_Price) AS Net_Inventory_Value
--     FROM sales s
--     JOIN products p
--         ON s.Product_ID = p.Product_ID
--     GROUP BY
--         MONTH(s.Sales_Date),
--         MONTHNAME(s.Sales_Date)
-- ) AS Monthly_Data

-- GROUP BY
--     Month_Number,
--     Month_Name

-- ORDER BY
--     Month_Number;
