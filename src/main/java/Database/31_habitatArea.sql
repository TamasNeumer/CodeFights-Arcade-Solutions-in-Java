/*Please add ; after each select statement*/
CREATE PROCEDURE habitatArea()
BEGIN
	SET @g = (SELECT CONCAT('MULTIPOINT(', GROUP_CONCAT( CONCAT(x, ' ', y) SEPARATOR ','),')') FROM places);
    SELECT ST_Area(ST_ConvexHull(ST_GeomFromText(@g))) as area;
END