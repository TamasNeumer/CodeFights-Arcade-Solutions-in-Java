/*Please add ; after each select statement*/
CREATE PROCEDURE localCalendar()
BEGIN
	SELECT 
        e.event_id, 
        DATE_FORMAT(e.date + INTERVAL s.timeshift MINUTE, 
                    IF(s.hours = 24, '%Y-%m-%d %k:%i', '%Y-%m-%d %h:%i %p')) AS formatted_date FROM events AS e
    LEFT JOIN settings AS s
    ON e.user_id = s.user_id
    ORDER BY e.event_id;
END