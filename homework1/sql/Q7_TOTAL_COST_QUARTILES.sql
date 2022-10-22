SELECT IFNULL(companyname, "MISSING_NAME"), 
       customerid, 
       round(total, 2) as totalexpenditures
FROM (
      SELECT customerid, 
             sum(unitprice*quantity) as total, 
             ntile(4) over(order by sum(unitprice*quantity)) as n1
      FROM orderdetail join 'order' on  'order'.id=orderdetail.orderid 
      GROUP BY customerid
     ) A 
     left join customer on customer.id=A.customerid 
WHERE A.n1=1
ORDER BY totalexpenditures

/*
四分位数（Quartile）是统计学中分位数的一种，即把所有数值由小到大排列并分成四等份，处于三个分割点位置的数值就是四分位数。
最后那个语句A.n1=1，是找the bottom四分位数.

分桶函数：num：桶的数量,该题要四分位数，则为4
NTILE(num) OVER(PARTITION BY expr1, ... ORDER expr1 [ASC|DESC],...)

override the NULL to 'MISSING_NAME' using IFNULL.

left join 左连接保留左边表的所有值，未匹配的为NULL,beacuse there are orders for CustomerIds that don’t appear in the Customer table.
*/
