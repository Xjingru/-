SELECT id, orderdate, 
       lag(orderdate, 1, orderdate) OVER (ORDER BY orderdate) as previousorderdate, 
       round(julianday(orderdate)-julianday(lag(orderdate,1,orderdate) OVER (ORDER BY orderdate)), 2) as difference
FROM 'order'
WHERE 'order'.customerid="BLONP"
ORDER BY orderdate
LIMIT 10;

/*
LAG(<expression>[,offset[, default_value]]) OVER (
    PARTITION BY expr,...
    ORDER BY expr [ASC|DESC],...
) 
expression 表示要访问的数据 offset 表示要返回上几行（不写默认是1） default_value 表示如果此行是顶行,没有上一行返回什么（如果不写默认是NULL）
PARTITION BY expr (expr处也写数据类型，可以进行分区，比如我写id则 一样的id进行leg（）)
 ORDER BY expr [ASC|DESC]就是顺序，因为按行访问
 
 julianday()可以计算时间差，在括号里直接将两个时间相减
 */
