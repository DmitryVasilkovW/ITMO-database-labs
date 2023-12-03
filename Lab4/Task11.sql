SELECT SOH.SalesOrderID
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID
WHERE SOH.CustomerID IN 
  (
        SELECT CustomerID
        FROM Sales.SalesOrderHeader
        GROUP BY CustomerID
        HAVING COUNT(DISTINCT SalesOrderID) >= 2
  )
GROUP BY SOH.SalesOrderID
HAVING COUNT(*) >= 2
