SELECT p.Name, pc.Name
FROM Production.Product AS p INNER JOIN Production.ProductSubcategory AS psc
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE Color = 'Red' AND ListPrice > 100
