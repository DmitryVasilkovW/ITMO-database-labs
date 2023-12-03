SELECT DISTINCT ProductID
FROM Sales.SalesOrderDetail
WHERE ProductID IN
(
    SELECT ProductID
    FROM Sales.SalesOrderDetail AS sod INNER JOIN Sales.SalesOrderHeader SOH on SOH.SalesOrderID = sod.SalesOrderID
    GROUP BY ProductID
    HAVING COUNT(DISTINCT CustomerID) <= 3
)
GROUP BY ProductID
HAVING COUNT(*) >= 2
