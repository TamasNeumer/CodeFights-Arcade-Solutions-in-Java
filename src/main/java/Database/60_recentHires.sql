/*Please add ; after each select statement*/
CREATE PROCEDURE recentHires()
BEGIN
    SELECT names FROM 
    (
        (SELECT name as names, 0 AS ordinal FROM (SELECT name from pr_department as names 
        ORDER BY date_joined DESC LIMIT 5) as pr ORDER by names ASC)
        UNION ALL
        (SELECT name as names, 1 AS ordinal  FROM (SELECT name from it_department as names 
        ORDER BY date_joined DESC LIMIT 5) as it ORDER by names ASC)
        UNION ALL
        (SELECT name as names, 2 AS ordinal  FROM (SELECT name from sales_department as names 
        ORDER BY date_joined DESC LIMIT 5) as sa ORDER by names ASC)
        ORDER BY ordinal, names
    ) AS test;
    
END