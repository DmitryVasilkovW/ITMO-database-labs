SELECT P.ProductID, P.Name, AVG(D.OrderQty)
OVER (ORDER BY H.OrderDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) as AvgQty
FROM Production.Product P
JOIN Sales.SalesOrderDetail D ON P.ProductID = D.ProductID
JOIN Sales.SalesOrderHeader H ON D.SalesOrderID = H.SalesOrderID
ORDER BY H.OrderDate
