SELECT psc.Name, MAX(p.ListPrice)
FROM Production.Product AS p INNER JOIN Production.ProductSubcategory AS psc
ON p.ProductSubcategoryID = psc.ProductSubcategoryID
WHERE p.Color = 'Red'
GROUP BY psc.Name
