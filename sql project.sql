-- E-COMMERCE SALES & CUSTOMER ANALYTICS
-- SQL DATA ANALYST PORTFOLIO PROJECT

-- =====================================================
-- SECTION 1: DATABASE SETUP
-- =====================================================

CREATE TABLE CUSTOMERS (
CUSTOMERID INT PRIMARY KEY,
CUSTOMERNAME VARCHAR(30),
GENDER VARCHAR(30),
AGE INT,
CITY VARCHAR(30),
STATE VARCHAR(30),
SIGNUPDATE date
);

CREATE TABLE PRODUCTS (
PRODUCTID INT PRIMARY KEY,
PRODUCTNAME VARCHAR(30),
CATEGORY VARCHAR(30),
PRICE DECIMAL(10,2),
COST DECIMAL(10,2)
);

CREATE TABLE ORDERS (
ORDERID INT PRIMARY KEY,
CUSTOMERID INT,
ORDERDATE DATE,
PAYMENTMETHOD VARCHAR(30),
ORDERSTATUS VARCHAR(30),
FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMERS(CUSTOMERID)
);

CREATE TABLE ORDERDETAILS (
ORDERDETAILID INT PRIMARY KEY,
ORDERID INT,
PRODUCTID INT,
QUANTITY INT,
UNITPRICE DECIMAL(10,2),
DISCOUNT DECIMAL(5,2),
FOREIGN KEY (PRODUCTID) REFERENCES PRODUCTS(PRODUCTID),
FOREIGN KEY (ORDERID) REFERENCES ORDERS(ORDERID)
);

CREATE TABLE PAYMENTS (
PAYMENTID INT PRIMARY KEY,
ORDERID INT,
PAYMENTDATE DATE,
PAYMENTMETHOD VARCHAR(30),
AMOUNT DECIMAL(10,2),
PAYMENTSTATUS VARCHAR(30),
FOREIGN KEY (ORDERID) REFERENCES ORDERS(ORDERID)
);

-- =====================================================
-- SECTION 2: DATA INSERTION
-- =====================================================

INSERT INTO Customers
(CustomerID, CustomerName, Gender, Age, City, State, SignupDate)
VALUES
(1, 'Rahul Sharma', 'Male', 25, 'Hyderabad', 'Telangana', '2025-01-15'),
(2, 'Priya Reddy', 'Female', 28, 'Vijayawada', 'Andhra Pradesh', '2025-01-20'),
(3, 'Arjun Kumar', 'Male', 24, 'Bengaluru', 'Karnataka', '2025-02-05'),
(4, 'Sneha Rao', 'Female', 31, 'Chennai', 'Tamil Nadu', '2025-02-12'),
(5, 'Kiran Patel', 'Male', 29, 'Mumbai', 'Maharashtra', '2025-02-18'),
(6, 'Anjali Singh', 'Female', 26, 'Delhi', 'Delhi', '2025-03-01'),
(7, 'Vikram Reddy', 'Male', 35, 'Hyderabad', 'Telangana', '2025-03-10'),
(8, 'Divya Nair', 'Female', 27, 'Kochi', 'Kerala', '2025-03-15'),
(9, 'Rohit Verma', 'Male', 30, 'Pune', 'Maharashtra', '2025-03-22'),
(10, 'Neha Gupta', 'Female', 23, 'Jaipur', 'Rajasthan', '2025-04-01'),
(11, 'Suresh Babu', 'Male', 40, 'Vijayawada', 'Andhra Pradesh', '2025-04-10'),
(12, 'Pooja Das', 'Female', 29, 'Kolkata', 'West Bengal', '2025-04-18'),
(13, 'Manoj Kumar', 'Male', 33, 'Chennai', 'Tamil Nadu', '2025-05-02'),
(14, 'Lakshmi Devi', 'Female', 36, 'Hyderabad', 'Telangana', '2025-05-12'),
(15, 'Amit Shah', 'Male', 27, 'Ahmedabad', 'Gujarat', '2025-05-20'),
(16, 'Swathi Reddy', 'Female', 25, 'Guntur', 'Andhra Pradesh', '2025-06-01'),
(17, 'Naveen Rao', 'Male', 32, 'Bengaluru', 'Karnataka', '2025-06-15'),
(18, 'Meena Kumari', 'Female', 38, 'Delhi', 'Delhi', '2025-07-01'),
(19, 'Ajay Kumar', 'Male', 26, 'Pune', 'Maharashtra', '2025-07-15'),
(20, 'Kavya Sri', 'Female', 24, 'Guntur', 'Andhra Pradesh', '2025-08-01');

INSERT INTO Products
(ProductID, ProductName, Category, Price, Cost)
VALUES
(101, 'Wireless Mouse', 'Electronics', 799.00, 450.00),
(102, 'Mechanical Keyboard', 'Electronics', 2499.00, 1500.00),
(103, 'USB-C Cable', 'Electronics', 499.00, 250.00),
(104, 'Bluetooth Speaker', 'Electronics', 1999.00, 1100.00),
(105, 'Power Bank', 'Electronics', 1499.00, 850.00),

(106, 'Running Shoes', 'Footwear', 2999.00, 1800.00),
(107, 'Casual Sneakers', 'Footwear', 2499.00, 1450.00),
(108, 'Sports Sandals', 'Footwear', 1299.00, 700.00),
(109, 'Formal Shoes', 'Footwear', 3499.00, 2100.00),

(110, 'Cotton T-Shirt', 'Clothing', 699.00, 350.00),
(111, 'Denim Jeans', 'Clothing', 1799.00, 950.00),
(112, 'Hoodie', 'Clothing', 1499.00, 800.00),
(113, 'Formal Shirt', 'Clothing', 1199.00, 650.00),

(114, 'Backpack', 'Accessories', 1299.00, 700.00),
(115, 'Wrist Watch', 'Accessories', 2499.00, 1400.00),
(116, 'Sunglasses', 'Accessories', 999.00, 500.00),

(117, 'Coffee Maker', 'Home Appliances', 3999.00, 2400.00),
(118, 'Electric Kettle', 'Home Appliances', 1799.00, 950.00),
(119, 'Air Fryer', 'Home Appliances', 5999.00, 3800.00),
(120, 'Mixer Grinder', 'Home Appliances', 4499.00, 2800.00);

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, PaymentMethod, OrderStatus)
VALUES
(5001, 1, '2026-01-05', 'UPI', 'Delivered'),
(5002, 3, '2026-01-08', 'Credit Card', 'Delivered'),
(5003, 5, '2026-01-12', 'Debit Card', 'Delivered'),
(5004, 2, '2026-01-18', 'UPI', 'Delivered'),
(5005, 7, '2026-01-22', 'Cash', 'Delivered'),
(5006, 10, '2026-02-03', 'UPI', 'Delivered'),
(5007, 4, '2026-02-10', 'Credit Card', 'Delivered'),
(5008, 8, '2026-02-15', 'UPI', 'Shipped'),
(5009, 12, '2026-02-20', 'Debit Card', 'Delivered'),
(5010, 1, '2026-03-02', 'UPI', 'Delivered'),
(5011, 14, '2026-03-08', 'Credit Card', 'Delivered'),
(5012, 6, '2026-03-15', 'UPI', 'Cancelled'),
(5013, 9, '2026-03-20', 'Cash', 'Delivered'),
(5014, 16, '2026-04-01', 'UPI', 'Delivered'),
(5015, 11, '2026-04-07', 'Debit Card', 'Delivered'),
(5016, 18, '2026-04-15', 'Credit Card', 'Shipped'),
(5017, 20, '2026-05-02', 'UPI', 'Delivered'),
(5018, 13, '2026-05-10', 'Cash', 'Delivered'),
(5019, 17, '2026-05-18', 'UPI', 'Delivered'),
(5020, 1, '2026-06-01', 'Credit Card', 'Delivered');

INSERT INTO OrderDetails
(OrderDetailID, OrderID, ProductID, Quantity, UnitPrice, Discount)
VALUES
(10001, 5001, 101, 2, 799.00, 5.00),
(10002, 5001, 110, 1, 699.00, 0.00),

(10003, 5002, 106, 1, 2999.00, 10.00),
(10004, 5002, 114, 1, 1299.00, 5.00),

(10005, 5003, 102, 1, 2499.00, 0.00),
(10006, 5003, 103, 2, 499.00, 5.00),

(10007, 5004, 117, 1, 3999.00, 10.00),
(10008, 5004, 118, 1, 1799.00, 5.00),

(10009, 5005, 107, 1, 2499.00, 0.00),
(10010, 5005, 116, 2, 999.00, 10.00),

(10011, 5006, 119, 1, 5999.00, 5.00),
(10012, 5006, 120, 1, 4499.00, 10.00),

(10013, 5007, 104, 2, 1999.00, 5.00),
(10014, 5007, 103, 1, 499.00, 0.00),

(10015, 5008, 109, 1, 3499.00, 10.00),
(10016, 5008, 113, 1, 1199.00, 5.00),

(10017, 5009, 111, 2, 1799.00, 10.00),
(10018, 5009, 112, 1, 1499.00, 0.00),

(10019, 5010, 101, 1, 799.00, 0.00),
(10020, 5010, 105, 1, 1499.00, 5.00),

(10021, 5011, 117, 1, 3999.00, 0.00),
(10022, 5011, 118, 2, 1799.00, 5.00),

(10023, 5012, 106, 1, 2999.00, 10.00),
(10024, 5012, 108, 1, 1299.00, 0.00),

(10025, 5013, 110, 3, 699.00, 5.00),
(10026, 5013, 114, 1, 1299.00, 0.00),

(10027, 5014, 115, 1, 2499.00, 10.00),
(10028, 5014, 116, 1, 999.00, 5.00),

(10029, 5015, 102, 1, 2499.00, 5.00),
(10030, 5015, 104, 1, 1999.00, 0.00),

(10031, 5016, 119, 1, 5999.00, 10.00),
(10032, 5016, 120, 1, 4499.00, 5.00),

(10033, 5017, 107, 2, 2499.00, 10.00),
(10034, 5017, 110, 2, 699.00, 0.00),

(10035, 5018, 109, 1, 3499.00, 5.00),
(10036, 5018, 111, 1, 1799.00, 10.00),

(10037, 5019, 103, 3, 499.00, 0.00),
(10038, 5019, 105, 1, 1499.00, 5.00),

(10039, 5020, 117, 1, 3999.00, 5.00),
(10040, 5020, 101, 2, 799.00, 0.00);

INSERT INTO Payments
(PaymentID, OrderID, PaymentDate, PaymentMethod, Amount, PaymentStatus)
VALUES
(90001, 5001, '2026-01-05', 'UPI', 2213.05, 'Completed'),
(90002, 5002, '2026-01-08', 'Credit Card', 3998.55, 'Completed'),
(90003, 5003, '2026-01-12', 'Debit Card', 3447.55, 'Completed'),
(90004, 5004, 'UPI', 5708.05, 'Completed'),
(90005, 5005, 'Cash', 4057.20, 'Completed'),
(90006, 5006, 'UPI', 9873.05, 'Completed'),
(90007, 5007, 'Credit Card', 4292.05, 'Completed'),
(90008, 5008, 'UPI', 4333.55, 'Pending'),
(90009, 5009, 'Debit Card', 4588.20, 'Completed'),
(90010, 5010, 'UPI', 2223.05, 'Completed'),
(90011, 5011, 'Credit Card', 7418.05, 'Completed'),
(90012, 5012, 'UPI', 3998.10, 'Failed'),
(90013, 5013, 'Cash', 3283.55, 'Completed'),
(90014, 5014, 'UPI', 3273.05, 'Completed'),
(90015, 5015, 'Debit Card', 4373.05, 'Completed'),
(90016, 5016, 'Credit Card', 10073.55, 'Pending'),
(90017, 5017, 'UPI', 5894.20, 'Completed'),
(90018, 5018, 'Cash', 5053.55, 'Completed'),
(90019, 5019, 'UPI', 2913.05, 'Completed'),
(90020, 5020, 'Credit Card', 5597.00, 'Completed');

-- =====================================================
-- SECTION 3: BUSINESS ANALYSIS
-- =====================================================

-- QUESTION 1: Total Number of Customers

SELECT COUNT(*) AS Total_Customers
FROM Customers;

-- QUESTION 2: Total Number of Products

SELECT COUNT(*) AS Total_Products
FROM Products;
 
-- QUESTION 3: Total Number of Orders

SELECT COUNT(*) AS Total_Orders
FROM Orders; 

-- QUESTION 4: Total Number of Customers with Orders

SELECT COUNT(DISTINCT CustomerID) AS Customers_With_Orders
FROM Orders;

-- QUESTION 5: Total Revenue from Completed Orders

SELECT ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)),2) AS Total_Revenue
FROM Orders o
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE o.OrderStatus <> 'Cancelled';

-- QUESTION 6: Total Quantity of Products Sold

SELECT SUM(od.Quantity) AS Total_Quantity_Sold
FROM Orders o
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE o.OrderStatus <> 'Cancelled';


-- QUESTION 7: Average Order Value

SELECT ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100))/ 
COUNT(DISTINCT o.OrderID),2) AS Average_Order_Value
FROM Orders o
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE o.OrderStatus <> 'Cancelled';


-- QUESTION 8: Revenue by Product Category

SELECT p.Category,ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)),
2) AS Category_Revenue
FROM Products p
JOIN OrderDetails od
    ON p.ProductID = od.ProductID
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY p.Category
ORDER BY Category_Revenue DESC;


-- QUESTION 9: Best-Selling Products by Quantity

SELECT p.ProductID,p.ProductName,
SUM(od.Quantity) AS Total_Quantity_Sold
FROM Products p
JOIN OrderDetails od
    ON p.ProductID = od.ProductID
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY
    p.ProductID,
    p.ProductName
ORDER BY Total_Quantity_Sold DESC;


-- QUESTION 10: Revenue Generated by Each Product

SELECT p.ProductID,p.ProductName,
ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)),2
) AS Total_Revenue FROM Products p
JOIN OrderDetails od
    ON p.ProductID = od.ProductID
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY p.ProductID,p.ProductName
ORDER BY Total_Revenue DESC;


-- QUESTION 11: Top Customers by Revenue

SELECT c.CustomerID,c.CustomerName,
ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)),
2) AS Total_Revenue
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY c.CustomerID,c.CustomerName
ORDER BY Total_Revenue DESC;


-- QUESTION 12: Revenue by Supplier

SELECT p.SupplierID,ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)),2
) AS Total_Revenue FROM Products p
JOIN OrderDetails od
    ON p.ProductID = od.ProductID
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY p.SupplierID
ORDER BY Total_Revenue DESC;


-- QUESTION 13: Average Product Price by Category

SELECT Category,ROUND(AVG(Price), 2) AS Average_Product_Price FROM Products
GROUP BY Category
ORDER BY Average_Product_Price DESC;


-- QUESTION 14: Number of Products in Each Category

SELECT Category,COUNT(*) AS Number_of_Products FROM Products
GROUP BY Category
ORDER BY Number_of_Products DESC;


-- QUESTION 15: Monthly Order Count

SELECT YEAR(o.OrderDate) AS Order_Year,MONTH(o.OrderDate) AS Order_Month,
COUNT(*) AS Monthly_Orders FROM Orders o
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY YEAR(o.OrderDate),MONTH(o.OrderDate)
ORDER BY Order_Year,Order_Month;


-- QUESTION 16: Monthly Revenue

SELECT YEAR(o.OrderDate) AS Order_Year,MONTH(o.OrderDate) AS Order_Month,
ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)),2
) AS Monthly_Revenue FROM Orders o
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY YEAR(o.OrderDate),MONTH(o.OrderDate)
ORDER BY Order_Year,Order_Month;


-- QUESTION 17: Most Frequently Used Payment Method

SELECT PaymentMethod,COUNT(*) AS Payment_Count
FROM Payments
GROUP BY PaymentMethod
ORDER BY Payment_Count DESC;


-- QUESTION 18: Customer Segmentation by Spending

SELECT CustomerID,CustomerName,Total_Spending,
CASE
	WHEN Total_Spending >= 8000 THEN 'High Value'
	WHEN Total_Spending >= 3000 THEN 'Medium Value'
	ELSE 'Low Value'
    END AS Customer_Segment
FROM(SELECT c.CustomerID,c.CustomerName,COALESCE(
SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)),0) AS Total_Spending
FROM Customers c
LEFT JOIN Orders o
 ON c.CustomerID = o.CustomerID
AND o.OrderStatus <> 'Cancelled'
LEFT JOIN OrderDetails od
 ON o.OrderID = od.OrderID
GROUP BY c.CustomerID,c.CustomerName
) AS CustomerSpending
ORDER BY Total_Spending DESC;


-- QUESTION 19: Rank Products by Revenue

SELECT p.ProductID,p.ProductName,ROUND(
SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)),
2) AS Total_Revenue,
RANK() OVER (ORDER BY SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)) DESC
) AS Revenue_Rank FROM Products p
JOIN OrderDetails od
    ON p.ProductID = od.ProductID
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY p.ProductID,p.ProductName
ORDER BY Revenue_Rank;


-- QUESTION 20: Top 3 Products in Each Category

WITH ProductRevenue AS
(
 SELECT p.ProductID,p.ProductName,p.Category,
SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)) AS Total_Revenue
FROM Products p
JOIN OrderDetails od
	ON p.ProductID = od.ProductID
JOIN Orders o
	ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY p.ProductID,p.ProductName,p.Category
),

RankedProducts AS
(SELECT ProductID,ProductName,Category,ROUND(Total_Revenue, 2) AS Total_Revenue,
RANK() OVER (PARTITION BY Category ORDER BY Total_Revenue DESC
) AS Category_Rank FROM ProductRevenue)
SELECT
    ProductID,
    ProductName,
    Category,
    Total_Revenue,
    Category_Rank FROM RankedProducts
WHERE Category_Rank <= 3
ORDER BY Category,Category_Rank;


-- QUESTION 21: Customers Who Never Placed an Order

SELECT
    c.CustomerID,
    c.CustomerName
FROM Customers c
LEFT JOIN Orders o
    ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;


-- QUESTION 22: Customers with the Most Orders

SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(o.OrderID) AS Total_Orders
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID,
    c.CustomerName
ORDER BY Total_Orders DESC;


-- QUESTION 23: Order Cancellation Rate

SELECT ROUND(100.0 * SUM(
CASE
	WHEN OrderStatus = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*),2
    ) AS Cancellation_Rate_Percent FROM Orders;


-- QUESTION 24: Payment Success Rate

SELECT ROUND(100.0 * SUM(CASE
WHEN PaymentStatus = 'Completed' THEN 1
ELSE 0 END) / COUNT(*),2
) AS Payment_Success_Rate FROM Payments;


-- QUESTION 25: Revenue by Payment Method

SELECT
    p.PaymentMethod,
    ROUND(SUM(p.Amount), 2) AS Total_Payment_Amount
FROM Payments p
WHERE p.PaymentStatus = 'Completed'
GROUP BY p.PaymentMethod
ORDER BY Total_Payment_Amount DESC;


-- QUESTION 26: Most Profitable Products

SELECT p.ProductID,p.ProductName,
ROUND(SUM((od.UnitPrice * (1 - od.Discount / 100)- p.Cost) * od.Quantity
),2) AS Total_Profit FROM Products p
JOIN OrderDetails od
    ON p.ProductID = od.ProductID
JOIN Orders o
    ON od.OrderID = o.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY p.ProductID,p.ProductName
ORDER BY Total_Profit DESC;


-- QUESTION 27: SKIPPED FOR NOW
-- Will be added later after learning the concept.


-- QUESTION 28: Customer Lifetime Value

SELECT
    c.CustomerID,
    c.CustomerName,
    COUNT(DISTINCT o.OrderID) AS Total_Orders,
    ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)
	),2) AS Total_Revenue FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY c.CustomerID,c.CustomerName
ORDER BY Total_Revenue DESC;


-- QUESTION 29: High-Value but Infrequent Customers

SELECT c.CustomerID,c.CustomerName,
COUNT(DISTINCT o.OrderID) AS Total_Orders,
ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)
),2) AS Total_Spending
FROM Customers c
JOIN Orders o
    ON c.CustomerID = o.CustomerID
JOIN OrderDetails od
    ON o.OrderID = od.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY c.CustomerID,c.CustomerName
HAVING COUNT(DISTINCT o.OrderID) = 1
AND SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)) >= 8000
ORDER BY Total_Spending DESC;


-- QUESTION 30: Month-over-Month Revenue Growth

WITH MonthlyRevenue AS
(SELECT
	    YEAR(o.OrderDate) AS Order_Year,
        MONTH(o.OrderDate) AS Order_Month,
SUM(od.Quantity * od.UnitPrice * (1 - od.Discount / 100)
) AS Monthly_Revenue FROM Orders o
JOIN OrderDetails od
ON o.OrderID = od.OrderID
WHERE o.OrderStatus <> 'Cancelled'
GROUP BY YEAR(o.OrderDate),MONTH(o.OrderDate)),
RevenueWithPreviousMonth AS
(SELECT Order_Year,Order_Month,Monthly_Revenue,
LAG(Monthly_Revenue) OVER (
ORDER BY Order_Year, Order_Month
) AS Previous_Month_Revenue
FROM MonthlyRevenue)
SELECT
    Order_Year,
    Order_Month,
    ROUND(Monthly_Revenue, 2) AS Monthly_Revenue,
    ROUND(Previous_Month_Revenue, 2) AS Previous_Month_Revenue,
    ROUND(100 * (Monthly_Revenue - Previous_Month_Revenue)/ Previous_Month_Revenue,2
    ) AS Revenue_Growth_Percent FROM RevenueWithPreviousMonth
ORDER BY Order_Year,Order_Month;







