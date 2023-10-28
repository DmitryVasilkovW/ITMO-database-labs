SELECT TOP 3 psc.Name AS SubcategoryName, COUNT(p.ProductID) AS ProductCount
FROM Production.Product AS p INNER JOIN Production.ProductSubcategory AS psc
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
GROUP BY psc.Name
ORDER BY ProductCount ASC
