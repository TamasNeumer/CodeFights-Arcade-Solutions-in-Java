/*Please add ; after each select statement*/
CREATE PROCEDURE routeLength()
BEGIN
    SELECT
        ROUND(SUM(DISTANCE(POINT(a.`x`, a.`y`), POINT(b.`x`, b.`y`))), 9) AS `total`
    FROM 
        cities AS a
    JOIN
        cities AS b ON (b.`id` - a.`id` = 1);
END