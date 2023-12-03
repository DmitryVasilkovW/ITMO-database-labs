SELECT p.ProductID FROM Production.Product as p
WHERE P.ProductID IN 
  (
    SELECT ProductID FROM Sales.SalesOrderDetail
    GROUP BY ProductID
    HAVING COUNT(DISTINCT SalesOrderID) = (SELECT COUNT(DISTINCT SalesOrderID) FROM Sales.SalesOrderDetail)
  )
