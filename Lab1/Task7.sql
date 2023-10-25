SELECT DISTINCT p.Color
FROM Production.Product AS p
WHERE p.ListPrice >= 10 AND p.ListPrice <= 50
