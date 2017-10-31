/*Please add ; after each select statement*/
CREATE PROCEDURE newsSubscribers()
BEGIN
SELECT DISTINCT subscriber FROM
(
	SELECT * FROM full_year
		UNION
	SELECT * FROM half_year
) AS x
WHERE newspaper LIKE "%Daily%"
ORDER BY subscriber;
END