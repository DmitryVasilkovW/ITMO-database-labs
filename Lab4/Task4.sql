with AveragePrices as 
  (
			select psc.productsubcategoryid, avg(p.listprice) as AveragePrice
      from production.product as p
      inner join production.productsubcategory as psc
      on p.productsubcategoryid = psc.productsubcategoryid
      group by psc.productsubcategoryid
  )
  
select p.productid, p.name, p.listprice
from production.product as p
inner join AveragePrices as ap
on p.productsubcategoryid = ap.productsubcategoryid
where p.listprice > ap.AveragePrice
