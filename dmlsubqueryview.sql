-- Create Database GroceryDB
CREATE DATABASE GroceryDB;

-- Use GroceryDB
USE GroceryDB;

-- Create Table: Items
CREATE TABLE Items (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert Data into Items Table
INSERT INTO Items (ItemID, ItemName, Category, Price)
VALUES
    (1, 'Apples', 'Fruits', 2.50),
    (2, 'Milk', 'Dairy', 1.50),
    (3, 'Bread', 'Bakery', 2.00),
    (4, 'Chicken', 'Meat', 5.00);

-- Create View: ExpensiveItems
CREATE VIEW ExpensiveItems AS
SELECT ItemID, ItemName, Price
FROM Items
WHERE Price > 3.00;

-- Select Data from ExpensiveItems View
SELECT * FROM ExpensiveItems;

-- Insert more data into Items Table
INSERT INTO Items (ItemID, ItemName, Category, Price)
VALUES
    (5, 'Oranges', 'Fruits', 3.00),
    (6, 'Cheese', 'Dairy', 4.50),
    (7, 'Bagels', 'Bakery', 2.50),
    (8, 'Salmon', 'Seafood', 8.50);

-- Select All Data from Items Table
SELECT * FROM Items;

-- Update Price of a Specific Item
UPDATE Items
SET Price = 3.50
WHERE ItemID = 1;

-- Delete an Item from Items Table
DELETE FROM Items
WHERE ItemID = 2;

-- Select All Data from Items Table After Updates
SELECT * FROM Items;

-- Drop View: ExpensiveItems
DROP VIEW ExpensiveItems;

-- Drop Table: Items
DROP TABLE Items;

-- Drop Database: GroceryDB
DROP DATABASE GroceryDB;
