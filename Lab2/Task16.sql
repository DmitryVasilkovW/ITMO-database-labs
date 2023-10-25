SELECT ProductID
FROM Sales.SalesOrderDetail
GROUP BY ProductID
HAVING COUNT(DISTINCT SalesOrderID) > 2 AND COUNT(OrderQty) > 1
