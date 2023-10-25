SELECT p.Name
FROM Production.Product AS p
WHERE len(p.Name)>3 AND p.Name LIKE 'D%' OR p.Name LIKE 'M%'

/* другой вариант */

SELECT p.Name
FROM Production.Product AS p
WHERE len(p.Name)>3 AND p.Name LIKE '[DM]%'
