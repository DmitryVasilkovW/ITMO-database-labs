SELECT h.CustomerID
FROM Sales.SalesOrderHeader h
WHERE SalesOrderID IN
(
    SELECT SalesOrderID
    FROM Sales.SalesOrderDetail d
    where d.ProductID IN
    (
        SELECT ProductID
        FROM Sales.SalesOrderDetail join Sales.SalesOrderHeader SOH on SalesOrderDetail.SalesOrderID = SOH.SalesOrderID
        GROUP BY ProductID
        HAVING COUNT(DISTINCT soh.CustomerID) >= 3
    )
    GROUP BY SalesOrderID
    HAVING COUNT(ProductID) >= 3
)
GROUP BY h.CustomerID
HAVING COUNT(SalesOrderID) >= 2;
