/*Please add ; after each select statement*/
CREATE PROCEDURE marketReport()
BEGIN
    SELECT IFNULL(country, "Total:") AS country, count(competitor) as competitors
    FROM foreignCompetitors
    GROUP BY country
    WITH ROLLUP;
END