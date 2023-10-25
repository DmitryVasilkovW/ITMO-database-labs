SELECT TOP 3 p.Name, p.Size
FROM Production.Product AS p
WHERE p.Color = 'Black'
ORDER BY p.ListPrice DESC
