SELECT pc.Name, COUNT(DISTINCT psc.Name), COUNT(DISTINCT p.ProductID)
FROM Production.Product AS p INNER JOIN Production.ProductSubcategory AS psc
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
ON psc.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
