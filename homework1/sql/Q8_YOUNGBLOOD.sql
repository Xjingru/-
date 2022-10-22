SELECT regiondescription, firstname, lastname, max(birthdate) as birthday 
FROM region 
     join employee 
     join employeeterritory 
     join territory 
     on employee.id=employeeterritory.employeeid and territory.id=employeeterritory.territoryid and territory.regionid=region.id
GROUP BY regionid
ORDER BY region.id;
