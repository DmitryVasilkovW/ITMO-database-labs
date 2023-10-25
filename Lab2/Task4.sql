SELECT ProductID, COUNT(*) AS TotalCount
FROM Sales.SalesOrderDetail
GROUP BY ProductID
