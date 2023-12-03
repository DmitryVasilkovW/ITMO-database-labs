SELECT TOP 1 Name FROM Production.Product
WHERE ProductID IN (SELECT TOP 1 ProductID FROM Sales.SalesOrderDetail GROUP BY ProductID ORDER BY SUM(OrderQty))

-- SELECT TOP 1 Name
--FROM Production.Product
--ORDER BY (SELECT SUM(OrderQty) FROM Sales.SalesOrderDetail WHERE ProductID = Production.Product.ProductID) DESC
