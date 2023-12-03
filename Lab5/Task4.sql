WITH temp (customerId, sum) AS
(SELECT t1.CustomerID, t1.sum FROM
(SELECT soh.CustomerID, sod.LineTotal as sum FROM Sales.SalesOrderHeader soh JOIN
Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY soh.CustomerID, sod.LineTotal) t1)

SELECT soh.CustomerID, MAX(t.sum) as MaxCheckPrice, MIN(t.sum) as MinCheckPrice 
FROM Sales.SalesOrderHeader soh JOIN temp t
ON soh.CustomerID = t.customerId
GROUP BY soh.CustomerID
