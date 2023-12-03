--WITH SubcategoryAverages AS (
--    SELECT
--        ProductSubcategoryID,
--        AVG(ListPrice) as Avg_Subcategory_Price
--    FROM Production.Product
--    GROUP BY ProductSubcategoryID
--)
--SELECT
--    P.ProductID,
--    P.ListPrice,
--    S.Avg_Subcategory_Price
--FROM Production.Product P
--JOIN SubcategoryAverages S ON P.ProductSubcategoryID = S.ProductSubcategoryID
--WHERE P.ListPrice > S.Avg_Subcategory_Price;

SELECT ProductID
FROM 
(
    SELECT P.ProductID, P.ListPrice, AVG(P.ListPrice) 
		OVER (PARTITION BY P.ProductSubcategoryID) as AvgPrice
    FROM Production.Product P
) as SubQuery
WHERE ListPrice > AvgPrice;
