--  TECHSHOP

--1. Create the database named "TechShop"
CREATE DATABASE techshop;

USE techshop;

/*2. Define the schema for the Customers, Products, Orders, OrderDetails and Inventory tables
based on the provided schema*/
CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
	FirstName VARCHAR(255),
	LastName VARCHAR(255),
	Email VARCHAR(255),
	Phone VARCHAR(20),
	Address TEXT
);

CREATE TABLE Products(
	ProductID INT PRIMARY KEY,
	ProductName VARCHAR(255),
	Description TEXT,
	Price DECIMAL(10,2)
);

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
	CustomerID INT,
	OrderDate DATE,
	TotalAmount DECIMAL(10,2),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails(
	OrderDetailID INT PRIMARY KEY,
	OrderID INT,
	ProductID INT,
	Quantity INT,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory(
	InventoryID INT PRIMARY KEY,
	ProductID INT,
	QuantityInStock INT,
	LastStockUpdate DATE,
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--  Insert at least 10 sample records into each of the following tables
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address) VALUES
(1, 'Rajesh', 'Kumar', 'rajesh@example.com', '91-9876543210', '123 Main St, Mumbai'),
(2, 'Priya', 'Sharma', 'priya@example.com', '91-8765432109', '456 Oak St, Delhi'),
(3, 'Amit', 'Patel', 'amit@example.com', '91-7654321098', '789 Pine St, Kolkata'),
(4, 'Ananya', 'Singh', 'ananya@example.com', '91-6543210987', '101 Palm St, Chennai'),
(5, 'Rahul', 'Verma', 'rahul@example.com', '91-5432109876', '202 Cedar St, Bangalore'),
(6, 'Neha', 'Gupta', 'neha@example.com', '91-4321098765', '303 Maple St, Hyderabad'),
(7, 'Vikram', 'Yadav', 'vikram@example.com', '91-3210987654', '404 Pine St, Pune'),
(8, 'Jaya', 'Rao', 'jaya@example.com', '91-2109876543', '505 Birch St, Ahmedabad'),
(9, 'Sanjay', 'Reddy', 'sanjay@example.com', '91-1098765432', '606 Elm St, Jaipur'),
(10, 'Meera', 'Nair', 'meera@example.com', '91-0987654321', '707 Oak St, Chandigarh');


INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES
(1, 'Laptop', 'High-performance laptop', 79999.99),
(2, 'Smartphone', 'Latest model with advanced features', 39999.99),
(3, 'Headphones', 'Noise-canceling wireless headphones', 5999.99),
(4, 'Camera', 'Professional-grade digital camera', 22499.99),
(5, 'Printer', 'Color inkjet printer', 9699.99),
(6, 'Tablet', '10-inch Android tablet', 14999.99),
(7, 'Gaming Console', 'Latest gaming console with 1TB storage', 24499.99),
(8, 'Bluetooth Speaker', 'Portable Bluetooth speaker', 2799.99),
(9, 'Fitness Tracker', 'Water-resistant fitness tracker', 4899.99),
(10, 'External Hard Drive', '1TB external hard drive', 5999.99);


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1, 1, '2024-01-01', 79999.99),
(2, 2, '2024-01-02', 39999.99),
(3, 3, '2024-01-03', 19999.99),
(4, 4, '2024-01-04', 22499.99),
(5, 5, '2024-01-05', 9699.99),
(6, 6, '2024-01-06', 14999.99),
(7, 7, '2024-01-07', 24499.99),
(8, 8, '2024-01-08', 2799.99),
(9, 9, '2024-01-09', 4899.99),
(10, 10, '2024-01-10', 5999.99);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 3),
(4, 2, 4, 1),
(5, 3, 5, 2),
(6, 3, 6, 1),
(7, 4, 7, 1),
(8, 5, 8, 4),
(9, 6, 9, 2),
(10, 7, 10, 3);

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock) VALUES
(1, 1, 20),
(2, 2, 30),
(3, 3, 15),
(4, 4, 10),
(5, 5, 25),
(6, 6, 18),
(7, 7, 5),
(8, 8, 50),
(9, 9, 22),
(10, 10, 30);

--TASK 2

--1. Write an SQL query to retrieve the names and emails of all customers. 
SELECT FirstName+' ' +LastName as CustomerName, Email FROM Customers; --1st

-- 2. Write an SQL query to list all orders with their order dates and corresponding customer names
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- 3.Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
INSERT INTO Customers (CustomerId,FirstName,LastName,Email,Phone,Address) 
VALUES (11,'vijay','kumar','vijay.kumar@xyz.com','91-9676902345', '456 Telugu Street Vijayawada');

/*4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by
increasing them by 10%.*/
UPDATE Products
SET Price = Price + (Price*0.10);
select * from products;

--5. Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
DECLARE @OrderIDToDelete INT;
SET @OrderIDToDelete = 10;
DELETE FROM OrderDetails WHERE OrderID=@OrderIDToDelete;
DELETE FROM Orders WHERE OrderID = @OrderIDToDelete;


/*6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,
order date, and any other necessary information*/
INSERT INTO Orders (OrderID,CustomerID, OrderDate, TotalAmount)
VALUES (10,10,'2024-01-15',84000);

/*7. Write an SQL query to update the contact information (e.g., email and address) of a specific
customer in the "Customers" table. Allow users to input the customer ID and new contact
information.*/
DECLARE @CustomerID INT;
DECLARE @NewEmail VARCHAR(255);
DECLARE @NewAddress VARCHAR(MAX);
SET @CustomerID = 1;
SET @NewEmail = 'alfredhitchcock@horror.com';
SET @NewAddress = 'bates motel';
UPDATE Customers
SET Email = @NewEmail, Address = @NewAddress
WHERE CustomerID = @CustomerID;
SELECT * FROM Customers;

/*8. Write an SQL query to recalculate and update the total cost of each order in the "Orders"
table based on the prices and quantities in the "OrderDetails" table.*/
UPDATE Orders
SET TotalAmount = (SELECT SUM(Products.Price*OrderDetails.Quantity) AS TotalAmount FROM OrderDetails, Products
WHERE OrderDetails.OrderId = Products.ProductID AND OrderDetails.OrderId = Orders.OrderID);
SELECT * FROM Orders;

/*9. Write an SQL query to delete all orders and their associated order details for a specific
customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID
as a parameter*/
DECLARE @CustomerIDToDelete INT;
SET @CustomerIDToDelete = 10;
DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerIDToDelete);
DELETE FROM Orders WHERE CustomerID = @CustomerIDToDelete;
SELECT * FROM Orders;

/*10. Write an SQL query to insert a new electronic gadget product into the "Products" table,
including product name, category, price, and any other relevant details.*/
INSERT INTO Products(ProductID,ProductName,Description,Price)
VALUES (11,'Adapter','electronic product',800);
select * from products;

/*11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from
"Pending" to "Shipped"). Allow users to input the order ID and the new status.*/
ALTER TABLE Orders
ADD Status VARCHAR(50);
UPDATE Orders
SET Status = 'Pending'
Where Status IS NULL;
Select * from Orders;
DECLARE @OrderIDToUpdate INT;
DECLARE @NewStatus VARCHAR(50);
SET @OrderIDToUpdate = 6;
SET @NewStatus = 'Shipped';
UPDATE Orders
SET Status = @NewStatus
WHERE OrderID = @OrderIDToUpdate;
SELECT * from Orders;

/*12. Write an SQL query to calculate and update the number of orders placed by each customer
in the "Customers" table based on the data in the "Orders" table*/
ALTER TABLE Customers
ADD NumberOfOrders INT;
SELECT * FROM Customers;
UPDATE Customers
SET NumberOfOrders = ( SELECT COUNT(OrderID) FROM Orders WHERE Customers.CustomerID = Orders.CustomerID);

--TASK 3

/*1. Write an SQL query to retrieve a list of all orders along with customer information (e.g.,
customer name) for each order.*/
SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerID, Customers.FirstName, Customers.LastName, Customers.Email FROM Orders
JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

--2. Write an SQL query to find the total revenue generated by each electronic gadget product. Include the product name and the total revenue.
SELECT Products.ProductName, SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
WHERE Products.Category = 'Electronic Gadget'
GROUP BY Products.ProductName;

/*3.Write an SQL query to list all customers who have made at least one purchase. Include their
names and contact information.*/
SELECT FirstName,LastName FROM CUSTOMERS WHERE CustomerID IN (SELECT CustomerID FROM Orders);

/*4.Write an SQL query to find the most popular electronic gadget, which is the one with the highest
total quantity ordered. Include the product name and the total quantity ordered.*/
SELECT TOP 1 Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered FROM Products
JOIN OrderDetails ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC;

/*5.Write an SQL query to retrieve a list of electronic gadgets along with their corresponding
categories*/
SELECT ProductName, Category FROM Products
WHERE Category = 'Electronic Gadget';

/*6.Write an SQL query to calculate the average order value for each customer. Include the
customer's name and their average order value.*/
SELECT Customers.CustomerID, Customers.FirstName, AVG(Orders.TotalAmount) as AverageOrderValue From Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
Group by Customers.CustomerID,Customers.FirstName;

/*7.Write an SQL query to find the order with the highest total revenue. Include the order ID,
customer information, and the total revenue*/
SELECT TOP 1 Orders.OrderID, Customers.CustomerID, Customers.FirstName, Customers.Email, SUM(OrderDetails.Quantity*Products.Price) AS TotalRevenue
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Orders.OrderID, Customers.CustomerID, Customers.FirstName, Customers.Email
ORDER BY TotalRevenue DESC;

/*8.Write an SQL query to list electronic gadgets and the number of times each product has been
ordered.*/
SELECT Products.ProductName, COUNT(OrderDetails.OrderID) AS NumberOfOrders FROM Products
JOIN OrderDetails ON Products.ProductID = OrderDetails.OrderID
WHERE Products.Category = 'Electronic gadget'
Group BY Products.ProductName;

/*9.Write an SQL query to find customers who have purchased a specific electronic gadget product.
Allow users to input the product name as a parameter*/
DECLARE @ElectronicGadgetToSearch VARCHAR(255);
SET @ElectronicGadgetToSearch = 'Gaming Console';
SELECT Customers.CustomerID, Customers.FirstName, Products.ProductName FROM Customers
JOIN Orders ON Orders.CustomerID = Customers.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
WHERE Products.ProductName = @ElectronicGadgetToSearch
GROUP BY Customers.CustomerID, Customers.FirstName, Products.ProductName;

/*10.Write an SQL query to calculate the total revenue generated by all orders placed within a
specific time period. Allow users to input the start and end dates as parameters*/
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
SET @StartDate = '2024-01-01';
SET @EndDate = '2024-01-05';
SELECT SUM(OrderDetails.quantity*Products.Price) AS TotalRevenue FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
JOIN Orders On OrderDetails.OrderID = Orders.OrderID
WHERE Orders.OrderDate BETWEEN @StartDate AND @EndDate;

/*Task 4. Subquery and its type:*/

/*1. Write an SQL query to find out which customers have not placed any orders.*/
SELECT CustomerID, FirstName, LastName FROM Customers
WHERE CustomerID NOT IN (SELECT  CustomerID FROM Orders);

/*2. Write an SQL query to find the total number of products available for sale*/
SELECT COUNT(ProductID) AS TotalProducts FROM Products;

/*3.Write an SQL query to calculate the total revenue generated by TechShop. */
SELECT SUM(TotalAmount) FROM ORDERS;

/*4.Write an SQL query to calculate the average quantity ordered for products in a specific category.
Allow users to input the category name as a parameter*/
DECLARE @CategoryToSearch VARCHAR(255);
SET @CategoryToSearch= 'Electronic gadget';
SELECT AVG(OrderDetails.Quantity) AS AverageQuantityOrdered FROM OrderDetails
WHERE ProductID IN ( SELECT ProductID FROM Products WHERE Category = @CategoryToSearch);

/*5. Write an SQL query to calculate the total revenue generated by a specific customer. Allow users
to input the customer ID as a parameter.*/
DECLARE @CustomerToCalculate INT;
SET @CustomerToCalculate = 3;
SELECT SUM(TotalAmount) AS TotalRevenue FROM Orders WHERE CustomerID = @CustomerToCalculate;

/*6. Write an SQL query to find the customers who have placed the most orders. List their names
and the number of orders they've placed.*/
SELECT TOP 1 Customers.FirstName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.FirstName
ORDER BY NumberOfOrders DESC;

/*7. Write an SQL query to find the most popular product category, which is the one with the highest
total quantity ordered across all orders.*/
SELECT TOP 1 Category, (SELECT SUM(OrderDetails.Quantity) FROM OrderDetails WHERE OrderDetails.ProductID = Products.ProductID)  AS TotalQuantity
FROM Products ORDER BY TotalQuantity DESC;

/*8. Write an SQL query to find the customer who has spent the most money (highest total revenue)
on electronic gadgets. List their name and total spending.
*/
SELECT TOP 1 Customers.CustomerID, Customers.FirstName, Customers.LastName,
(SELECT SUM(OrderDetails.Quantity*Products.Price) FROM Orders, OrderDetails, Products
WHERE Orders.OrderID=OrderDetails.OrderID AND OrderDetails.ProductID = Products.ProductID
AND Orders.CustomerID = Customers.CustomerID AND Products.Category = 'Electronic Gadget') AS TotalSpending From Customers
ORDER BY TotalSpending DESC;

/*9. Write an SQL query to calculate the average order value (total revenue divided by the number of
orders) for all customers.*/
SELECT customers.FirstName, customers.LastName,
(SELECT AVG(orders.TotalAmount) from Orders Where customers. customerId=Orders.CustomerID) AS averageOrderVa1ue
From customers;

/*10 Write an SQL query to find the total number of orders placed by each customer and list their
names along with the order count.*/
SELECT Customers.CustomerID, Customers.FirstName, Customers.LastName,
(SELECT COUNT(Orders.OrderID) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID) AS OrderCount FROM Customers;
