SELECT ProductSubcategoryID
FROM Production.Product
GROUP BY ProductSubcategoryID
HAVING COUNT(*) > 10
