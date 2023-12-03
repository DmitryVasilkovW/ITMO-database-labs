--WITH CTE AS 
--(
--    SELECT CustomerID, ProductID
--    FROM Sales.SalesOrderHeader soh join Sales.SalesOrderDetail sod
--    ON soh.SalesOrderID = sod.SalesOrderID
--    GROUP BY CustomerID, ProductID
--    HAVING COUNT(DISTINCT sod.SalesOrderID) >= 2
--)

--SELECT DISTINCT CustomerID
--FROM CTE;


WITH CTE AS 
(
    SELECT CustomerID, ProductID, COUNT(DISTINCT sod.SalesOrderID) as OrderCount
    FROM Sales.SalesOrderHeader soh join Sales.SalesOrderDetail sod
    ON soh.SalesOrderID = sod.SalesOrderID
    GROUP BY CustomerID, ProductID
)

SELECT CustomerID
FROM CTE
WHERE OrderCount >= 2
GROUP BY CustomerID
HAVING MIN(OrderCount) >= 2;
