
-- >>>>>>>>>>>>>>>Step:1.create database<<<<<<<<<<<<<<
-- CREATE DATABASE Inventory_MIS;
-- USE Inventory_MIS;

-- >>>>>>>>>>>>>Step:2 create tables<<<<<<<<<<<<<<<<
-- CREATE TABLE Categories (
--     Category_ID INT PRIMARY KEY,
--     Category_Name VARCHAR(50)
-- );
-- CREATE TABLE Suppliers (
--     Supplier_ID INT PRIMARY KEY,
--     Supplier_Name VARCHAR(100),
--     Contact_Number VARCHAR(15),
--     City VARCHAR(50)
-- );
-- CREATE TABLE Products (
--     Product_ID INT PRIMARY KEY,
--     Product_Name VARCHAR(100),
--     Category_ID INT,
--     Supplier_ID INT,
--     Unit_Price DECIMAL(10,2),
--     Reorder_Level INT,
--     FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID),
--     FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID)
-- );
-- CREATE TABLE Purchases (
--     Purchase_ID INT PRIMARY KEY,
--     Purchase_Date DATE,
--     Product_ID INT,
--     Quantity INT,
--     FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
-- );
-- CREATE TABLE Sales (
--     Sales_ID INT PRIMARY KEY,
--     Sales_Date DATE,
--     Product_ID INT,
--     Quantity INT,
--     FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
-- );
-- SHOW TABLES;
-- DESCRIBE Products;

-- *********Step 3:csv file import>>>(""tables>>right click categories>>table import wizard>>> brower import the data"")******* 

-- *********Step:4 Verify the Data in the project im**********
-- SELECT COUNT(*) FROM Categories;
-- SELECT COUNT(*) FROM Suppliers;
-- SELECT COUNT(*) FROM Products;
-- SELECT COUNT(*) FROM Purchases;
-- SELECT COUNT(*) FROM Sales;

-- >>>>>>>>>>>>>>Step 5:View the Data in the project im<<<<<<<<<<<<<<<<<<
-- SELECT * FROM Categories;
-- SELECT * FROM Suppliers;
-- SELECT * FROM Products;
-- SELECT * FROM Purchases;
-- SELECT * FROM Sales;

-- >>>>>>>>>>>>.Step 6: Learn Basic SQL Queries,<<<<<<<<<<<<<<<<<<<

-- 1. Show all products:
-- SELECT * FROM Products;

-- 2.Show product names only:
-- SELECT Product_Name
-- FROM Products;

-- 3. Products costing more than ₹5000
-- SELECT *
-- FROM Products
-- WHERE Unit_Price > 5000;

-- 4.Products ordered by price
-- SELECT *
-- FROM Products
-- ORDER BY Unit_Price DESC;

-- 5.Top 10 expensive products
-- SELECT *
-- FROM Products
-- ORDER BY Unit_Price DESC
-- LIMIT 10;

-- >>>>>>>>>>>>Step:7.Aggregate Functions<<<<<<<<<<<<<<<<
           -- 1.Total number of products
-- SELECT COUNT(*)
-- FROM Products;
           -- 2.Average product price
-- SELECT AVG(Unit_Price)
-- FROM Products;
			-- 3.Highest price
-- SELECT MAX(Unit_Price)
-- FROM Products;
		    -- 4.Lowest price
-- SELECT MIN(Unit_Price)
-- FROM Products;

-- >>>>>>>>>>>>>>>>>>Step:8  GROUP BY<<<<<<<<<<<<<<<<<

         -- 1.Category-wise product count
-- SELECT Category_ID,
-- COUNT(Product_ID)
-- FROM Products
-- GROUP BY Category_ID;

-- >>>>>>>>>>>>>>Step 9: JOIN (Very Important)<<<<<<<<<<<<<<<<

       -- 1.Product with Category
-- SELECT
-- P.Product_Name,
-- C.Category_Name
-- FROM Products P
-- JOIN Categories C
-- ON P.Category_ID = C.Category_ID;

        -- 2.Product with Supplier
-- SELECT
-- P.Product_Name,
-- S.Supplier_Name
-- FROM Products P
-- JOIN Suppliers S
-- ON P.Supplier_ID = S.Supplier_ID;








