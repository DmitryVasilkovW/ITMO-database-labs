SELECT CustomerID, SalesOrderID, ROW_NUMBER() OVER (ORDER BY OrderDate)
FROM Sales.SalesOrderHeader
