/*Please add ; after each select statement*/
CREATE PROCEDURE pastEvents()
BEGIN
    SET @mostrecent = (SELECT event_date FROM Events ORDER BY event_date DESC LIMIT 1);
	SELECT name, event_date FROM Events WHERE
    event_date >= DATE(@mostrecent) - INTERVAL 1 WEEK AND event_date NOT LIKE @mostrecent ORDER BY event_date DESC;
END