with A as(
	SELECT row_number() over (order by Product.Id) as r, productname
	FROM(
	     SELECT product.id, productname
             FROM product  
		    join orderdetail on product.id = orderdetail.productid
		    join 'order' on orderdetail.orderid = 'order'.id
		    join customer on customerid =customer.id
	     WHERE orderDate="2014-12-25" and companyname="Queen Cozinha"
	     GROUP BY product.id
	    )
),
B as(
   SELECT r, productname 
   FROM A
   WHERE r=1
   UNION ALL
   SELECT A.r, A.name || ', ' || B.name
   FROM B join A on A.r=B.r+1
)
SELECT name
FROM B
ORDER BY r
LIMIT 1;

/*
wrong
*/
