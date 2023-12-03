--WITH allPurchases (customerId, amount) AS
--(SELECT soh.CustomerID, COUNT(*) FROM Sales.SalesOrderHeader as soh JOIN
--Sales.SalesOrderDetail as sod ON soh.SalesOrderID = sod.SalesOrderID
--GROUP BY soh.CustomerID),

--concretePurchases (customerId, productId, amount) AS
--(SELECT soh.CustomerID, sod.ProductID, COUNT(sod.ProductId) FROM Sales.SalesOrderHeader
--as soh JOIN Sales.SalesOrderDetail as sod ON soh.SalesOrderID = sod.SalesOrderID
--GROUP BY soh.CustomerID, sod.ProductID)

--SELECT allPurchases.customerId, concretePurchases.amount / allPurchases.amount
--FROM allPurchases join concretePurchases
--ON allPurchases.customerId = concretePurchases.customerId

WITH concretePurchases (customerId, productId, amount) AS
(SELECT soh.CustomerID, sod.ProductID, COUNT(sod.ProductId)
FROM Sales.SalesOrderHeader as soh
JOIN Sales.SalesOrderDetail as sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY soh.CustomerID, sod.ProductID)

SELECT soh.CustomerID, concretePurchases.amount / COUNT(*)
FROM Sales.SalesOrderHeader as soh
JOIN Sales.SalesOrderDetail as sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN concretePurchases ON soh.CustomerID = concretePurchases.customerId
GROUP BY soh.CustomerID, concretePurchases.amount
