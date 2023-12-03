SELECT p.Name, COUNT(*) as TotalCustomers
FROM Sales.SalesOrderDetail as sod
INNER JOIN Production.Product as p
ON sod.ProductID = p.ProductID
WHERE p.ProductID NOT IN
    (
        SELECT sod.ProductID
        FROM Sales.SalesOrderDetail as sod
        INNER JOIN Production.Product as p ON sod.ProductID = p.ProductID
        GROUP BY sod.ProductID
        HAVING COUNT(Distinct p.Color) = 2
    )
GROUP BY sod.ProductID, p.Name
HAVING COUNT(DISTINCT sod.SalesOrderID) > 1 AND COUNT(DISTINCT p.Color) = 1
