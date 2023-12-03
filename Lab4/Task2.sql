SELECT TOP 1 c.CustomerID from sales.Customer as c INNER JOIN
(SELECT soh.CustomerID, SUM(sod.UnitPrice * sod.OrderQty) as Total
 FROM Sales.SalesOrderHeader as soh 
 INNER JOIN Sales.SalesOrderDetail sod on soh.SalesOrderID = sod.SalesOrderID
 GROUP BY soh.CustomerID) AS subquerry
ON c.CustomerID = subquerry.CustomerID
ORDER BY Total DESC
