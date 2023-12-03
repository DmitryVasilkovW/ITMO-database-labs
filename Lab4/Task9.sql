SELECT DISTINCT p.ProductID
FROM Production.Product p
JOIN Sales.SalesOrderDetail sod ON p.ProductID = sod.ProductID
JOIN
(
    SELECT pc.ProductCategoryID, MAX(p.ListPrice) AS MaxPrice
    FROM Production.Product p
    JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
    JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
    GROUP BY pc.ProductCategoryID
)
    AS maxPricePerCategory ON p.ListPrice = maxPricePerCategory.MaxPrice
WHERE EXISTS
(
    SELECT *
    FROM Sales.SalesOrderDetail sod2
    WHERE sod.SalesOrderID = sod2.SalesOrderID
    AND sod.ProductID != sod2.ProductID
)
