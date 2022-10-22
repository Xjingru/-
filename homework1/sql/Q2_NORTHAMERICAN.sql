SELECT id, 
       shipcountry, 
       (CASE WHEN shipcountry in ('USA', 'Mexico', 'Canada') THEN 'NorthAmerica' ELSE 'OtherPlace' END) as locationplace
FROM 'order'
WHERE id > 15444 and id-20 < 15444
ORDER BY id;

