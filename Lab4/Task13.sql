SELECT ProductSubcategoryID, Name AS SubcategoryName
FROM Production.ProductSubcategory
WHERE ProductSubcategoryID IN
(
    SELECT p.ProductSubcategoryID
    FROM Production.Product p
    WHERE p.ProductID IN
    (
        SELECT sod.ProductID
        FROM Sales.SalesOrderDetail sod
        GROUP BY sod.ProductID
        HAVING COUNT(*) > 3
    )
    GROUP BY p.ProductSubcategoryID
    HAVING COUNT(DISTINCT p.ProductID) > 3
)
