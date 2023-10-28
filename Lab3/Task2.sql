select s.Name
from Production.ProductSubcategory s
join Production.ProductSubcategory sp
on s.Name = sp.Name and s.ProductSubcategoryID != sp.ProductSubcategoryID
