SELECT productname as productnameproductnameproductname, companyname, contactname
FROM (
      SELECT productname, companyname, contactname, min(orderdate) 
      FROM customer 
           join product 
           join 'order' 
           join orderdetail 
           on customer.id='order'.customerid and 'order'.id=orderdetail.orderid and orderdetail.productid=product.id    
      WHERE product.discontinued=1 
      GROUP BY productname
     )
ORDER BY productname;
