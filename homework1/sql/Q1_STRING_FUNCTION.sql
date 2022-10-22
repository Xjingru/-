SELECT distinct shipname, 
       substr(shipname, 1, instr(shipname, '-')-1) as  precedehyphenname
FROM 'order'
WHERE shipname like '%-%'
ORDER BY shipname;

