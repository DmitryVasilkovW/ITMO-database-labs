SELECT ProductSubcategoryID, COUNT(*) AS TotalCount
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL AND Color IS NOT NULL
GROUP BY ProductSubcategoryID
