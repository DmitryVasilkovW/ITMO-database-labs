SELECT ps.Name, COUNT(p.ProductID)
FROM Production.Product AS p INNER JOIN Production.ProductSubcategory AS ps
ON p.ProductSubcategoryID = ps.ProductSubcategoryID
join Production.ProductSubcategory s1
on ps.ProductSubcategoryID != s1.ProductSubcategoryID
GROUP BY ps.Name
