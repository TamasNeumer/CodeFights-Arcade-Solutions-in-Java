
/*TOP 1 - most elegant*/
/*Please add ; after each select statement*/
CREATE PROCEDURE closestCells()
BEGIN
    select l.id id1,
           (select id 
                from positions r
                where l.id <> r.id
                order by power(l.x - r.x, 2) + power(l.y - r.y, 2) limit 1
           ) id2
        from positions l;
END


/*Based on: https://stackoverflow.com/questions/11683712/sql-group-by-and-min-mysql*/
/*Please add ; after each select statement*/
CREATE PROCEDURE closestCells()
BEGIN

    SELECT temp1.p1_id as id1, temp2.p2_id as id2 FROM (
        SELECT
            MIN(SQRT(POW(p1.x - p2.x,2) + POW(p1.y - p2.y,2))) AS min_distance,
            p1.id AS p1_id, p1.x AS p1_x, p1.y AS p1_y,
            p2.id AS p2_id, p2.x AS p2_x, p1.y AS p2_y FROM positions AS p1
        CROSS JOIN positions as p2
        WHERE p1.id <> p2.id
        GROUP BY p1.id
    ) AS temp1
    INNER JOIN 
    (
        SELECT 
            SQRT(POW(p1.x - p2.x,2) + POW(p1.y - p2.y,2)) AS distance,
            p1.id AS p1_id, p1.x AS p1_x, p1.y AS p1_y,
            p2.id AS p2_id, p2.x AS p2_x, p1.y AS p2_y FROM positions AS p1
        CROSS JOIN positions as p2
        WHERE p1.id <> p2.id
    ) AS temp2 ON temp1.p1_id = temp2.p1_id AND temp1.min_distance = temp2.distance
    ORDER BY temp1.p1_id;
END