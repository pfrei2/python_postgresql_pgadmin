
1. What are the details of all customers whose country is 'Spain'?
SELECT * FROM Customers WHERE Country = 'Spain';

2. What are the distinct cities of customers from Germany with a city containing the letter 'B'?
SELECT DISTINCT City FROM Customers WHERE Country = 'Germany' AND City LIKE 'B'

3. What are the number of orders placed by each customer? Sort the result by the number of orders in descending order.
SELECT 
    CustomerID, 
    COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID
ORDER BY OrderCount DESC;

4. What are the customers who have placed more than 3 orders?
SELECT
    CustomerID,
    Count(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID
HAVING Count(OrderID) > 3;


5. What are the top 5 most expensive products? Round the price to 2 decimal places.
SELECT 
    ProductName, 
    ROUND(CAST(Price AS NUMERIC), 2) AS Price
FROM Products
ORDER BY Price DESC
LIMIT 5;
6. What are the order details (ProductID, Quantity) for customers from France?$
SELECT          
    Orders.OrderID, 
    Customers.CustomerName,
    Customers.Country, 
    OrderDetails.ProductID,
    OrderDetails.Quantity
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN OrderDetails ON Orders.OrderID = = OrderDetails.OrderID

7. Area there products without a category assigned?
SELECT ProductName, ProductID
FROM Products
WHERE CategoryID IS NULL;

8. What are all orders and their employees?
SELECT
    Orders.OrderID,
    Employees.EmployeeID,
    Employees.LastName,
    Employees.FirstName
FROM Orders
LEFT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID;


9. What is the average, minimum, and maximum price of products? Round the values to 2 decimal places.
SELECT 
    ROUND(CAST(AVG(Price) AS NUMERIC), 2) AS AveragePrice, 
    ROUND(CAST(MIN(Price) AS NUMERIC), 2) AS MinimumPrice
    ROUND(CAST(MAX(Price) AS NUMERIC), 2) AS MAXPRICE
FROM Products;

10. What are the products with prices between 10 and 50? Round the price to 2 decimal places and sort the result by price in descending order.
SELECT
    ProductID, 
    ProductName, 
    (ROUND(CAST(Price) AS NUMERIC), 2) AS Price
FROM Products
WHERE Price BETWEEN 10 AND 50
ORDER BY Price DESC;


11. What are the shippers and the total number of orders shipped by each shipper, including those with no orders?
SELECT
    Shippers.ShipperName,
    COUNT(Orders.OrderID) AS TotalOrders
FROM Shippers
LEFT JOIN Orders
ON Shippers.ShipperID = Orders.ShipperID
GROUP BY Shippers.ShipperName;

12. What are the employees who have processed > 5 orders? Sort the result by the number of orders in descending order.
SELECT
    Employees.FirstName,
    COUNT(OrderID) AS TotalOrders
FROM Employees
INNER JOIN Orders ON Employees.EmployeeID = Orders.EmployeeID;
GROUP BY Employees.FirstName
HAVING COUNT(OrderID) > 5
ORDER BY COUNT(OrderID) DESC;

13. What is the total revenue for each product within each order, including the product name and ordered by order ID and total revenue in descending order?
SELECT 
	od.OrderID,
	p.ProductID,
	p.ProductName,
	ROUND(CAST(SUM(p.Price * od.Quantity) AS NUMERIC), 2) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY od.OrderID, p.ProductID, p.ProductName
ORDER BY od.OrderID, TotalRevenue DESC;

14. What are the customers, employees, and the total number of orders placed by each customer?
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    e.EmployeeID, 
    e.FirstName, 
    e.LastName, 
    COUNT(o.OrderID) AS TotalOrders
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN Employees e ON o.EmployeeID = e.EmployeeID
GROUP BY c.CustomerID, c.CustomerName, e.EmployeeID, e.FirstName, e.LastName;

15. What are the products with an average price higher than the overall average product price? 
    Round the price to 2 decimal places and sort the result by price in descending order.
SELECT 
    ProductID, 
    ProductName, 
    ROUND(CAST(Price AS NUMERIC), 2) AS Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products)
ORDER BY Price DESC;

