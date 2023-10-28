SELECT p.Name
FROM Production.Product AS p INNER JOIN Purchasing.ProductVendor AS pv
ON p.ProductID = pv.ProductID
GROUP BY p.Name
HAVING COUNT(DISTINCT pv.BusinessEntityID) > 1
