SELECT TOP 1 pc.Name
FROM Production.Product AS p INNER JOIN Production.ProductSubcategory AS psc
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
ON psc.ProductCategoryID = pc.ProductCategoryID
INNER JOIN Sales.SalesOrderDetail AS sod
ON p.ProductID = sod.ProductID
GROUP BY pc.Name
ORDER BY SUM(sod.OrderQty) DESC
