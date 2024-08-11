-- HERE WE ARE TRYING TO DISPLAY LIMIT AND ORDER BY FUNCTION WHERE
-- WE ARE DISPLAYING PRODUCT QUANTITY IS DESCENDING ORDER
select s.supnr,s.supname,p.prodname,p.prodquantity
from product as p, supplier s
where p.prodnr = s.prodnr
order by p.prodquantity desc
limit 3
