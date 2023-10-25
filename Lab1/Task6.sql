SELECT p.Name, p.Color
FROM Production.Product AS p
WHERE p.Color IS NOT NULL AND p.Size IS NOT NULL
