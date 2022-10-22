SELECT distinct shipper.companyname, 
       round(latenum*1.0/totalnum*100, 2) as percentage
FROM shipper, 
     (
      'order' 
      NATURAL JOIN (
                    SELECT shipvia, count(*) as latenum 
                    FROM 'order' 
                    WHERE ShippedDate > RequiredDate 
                    GROUP BY shipvia
                   ) 
      NATURAL JOIN (
                    SELECT count(*) as totalnum, shipvia 
                    FROM 'order' 
                    GROUP BY shipvia
                   )
     ) as A
 WHERE A.shipvia=shipper.id
 ORDER BY percentage desc;
