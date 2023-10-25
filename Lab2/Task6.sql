SELECT CustomerID
FROM Sales.SalesOrderHeader
GROUP BY CustomerID, OrderDate
HAVING COUNT(DISTINCT SalesOrderID) > 1
