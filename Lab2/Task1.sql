SELECT Color, COUNT(*)
FROM Production.Product
WHERE ListPrice >= 30 AND Color IS NOT NULL
GROUP BY Color
