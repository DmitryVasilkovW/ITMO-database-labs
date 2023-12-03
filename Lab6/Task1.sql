SELECT SalesOrderID, ProductID, UnitPrice * COUNT(OrderQty) 
OVER (PARTITION BY SalesOrderID) AS 'Income'
FROM Sales.SalesOrderDetail
