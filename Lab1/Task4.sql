SELECT p.Name, p.Color, p.Size
FROM Production.Product AS p
WHERE p.ListPrice > 100 AND p.Color = 'Black'
ORDER BY p.ListPrice ASC
