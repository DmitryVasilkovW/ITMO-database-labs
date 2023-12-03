WITH CTE AS 
(
    SELECT CustomerID, ProductID
    FROM Sales.SalesOrderHeader soh join Sales.SalesOrderDetail sod
    ON soh.SalesOrderID = sod.SalesOrderID
    GROUP BY CustomerID, ProductID
    HAVING COUNT(DISTINCT sod.SalesOrderID) >= 2
)

SELECT DISTINCT CustomerID
FROM CTE;
