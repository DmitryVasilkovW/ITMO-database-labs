SELECT Color, COUNT(*) AS TotalCount
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color
ORDER BY TotalCount DESC
