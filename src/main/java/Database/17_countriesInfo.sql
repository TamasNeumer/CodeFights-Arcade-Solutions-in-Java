/*Please add ; after each select statement*/
CREATE PROCEDURE countriesInfo()
BEGIN
    SELECT 
        COUNT(name) AS number,
        SUM(population) / COUNT(name) AS average,
        SUM(population) as total
        FROM countries;
END