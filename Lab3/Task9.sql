SELECT TOP 1 p.Name
FROM Production.Product AS p INNER JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
GROUP BY p.Name
ORDER BY SUM(sod.OrderQty) DESC
