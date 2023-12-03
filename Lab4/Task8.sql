SELECT DISTINCT ProductID
FROM Sales.SalesOrderDetail
WHERE ProductID IN
(
    SELECT sod.ProductID
    FROM Sales.SalesOrderDetail sod
    JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
    GROUP BY sod.ProductID
    HAVING COUNT(DISTINCT soh.CustomerID) <= 3
)
