WITH temp (productId, totalCustomers) AS
(SELECT sod.ProductID, COUNT(DISTINCT soh.CustomerID) FROM Sales.SalesOrderDetail 
AS sod JOIN Sales.SalesOrderHeader soh ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY sod.ProductID)

SELECT p.ProductID, t.totalCustomers FROM Production.Product as p
JOIN temp t ON t.productId = p.ProductID
