SELECT ProductID, ProductSubcategoryID, ListPrice,
ListPrice - MIN(ListPrice) OVER(PARTITION BY ProductSubcategoryID) as PriceDifference
FROM Production.Product;
