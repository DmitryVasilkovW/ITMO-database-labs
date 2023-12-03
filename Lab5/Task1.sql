--SELECT tmp.cid, AVG(tmp.c) FROM
--(SELECT soh.CustomerID as cid, COUNT(sod.ProductId) AS c 
--FROM Sales.SalesOrderHeader AS soh
--JOIN Sales.SalesOrderDetail as sod ON soh.SalesOrderID = sod.SalesOrderID
--GROUP BY soh.CustomerID) tmp
--GROUP BY tmp.cid

WITH tmp (cid, c) as
(SELECT soh.CustomerID as cid, COUNT(sod.ProductId) AS c
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesOrderDetail as sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY soh.CustomerID)

SELECT tmp.cid, AVG(tmp.c) FROM tmp
GROUP BY tmp.cid
