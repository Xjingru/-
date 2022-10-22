SELECT categoryname, 
       count(categoryid) as num, 
       round(avg(unitprice), 2) as average, 
       min(unitprice) as minimum, 
       max(unitprice) as maximum, 
       sum(unitsonorder) as ordernum 
FROM product ,category 
WHERE category.id=product.categoryid
group by categoryid 
having num > 10
ORDER BY categoryid;
