SELECT v.CreditRating, COUNT(DISTINCT pv.ProductID)
FROM Purchasing.Vendor AS v INNER JOIN Purchasing.ProductVendor AS pv
ON v.BusinessEntityID = pv.BusinessEntityID
GROUP BY v.CreditRating
