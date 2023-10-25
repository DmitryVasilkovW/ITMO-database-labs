SELECT ProductSubcategoryID, COUNT(*) AS TotalCount
FROM Production.ProductSubcategory
GROUP BY ProductSubcategoryID
