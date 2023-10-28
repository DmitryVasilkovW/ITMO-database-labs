SELECT v.Name, COUNT(pod.ProductID)
FROM Purchasing.Vendor AS v INNER JOIN Purchasing.ProductVendor AS pod
ON v.BusinessEntityID = pod.BusinessEntityID
GROUP BY v.Name
