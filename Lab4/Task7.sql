SELECT c.CustomerID
FROM Sales.Customer AS c
WHERE c.CustomerID IN
  (
    SELECT soh.CustomerID
    FROM Sales.SalesOrderHeader AS soh
    WHERE EXISTS
      (
        SELECT 1
        FROM Sales.SalesOrderDetail AS sod
        WHERE sod.SalesOrderID = soh.SalesOrderID
        GROUP BY sod.ProductID
        HAVING COUNT(DISTINCT sod.ProductID) = COUNT(DISTINCT sod.SalesOrderID)
      )
  )
