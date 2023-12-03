WITH temp (salesOrderId, amount) AS
(SELECT sod.SalesOrderID, SUM(sod.OrderQty) FROM
Sales.SalesOrderDetail sod GROUP BY sod.SalesOrderID)

SELECT DISTINCT soh.CustomerID FROM Sales.SalesOrderHeader soh JOIN
Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
JOIN temp t ON soh.SalesOrderID = t.salesOrderId
GROUP BY soh.CustomerID, t.amount
HAVING COUNT(sod.OrderQty) != t.amount
