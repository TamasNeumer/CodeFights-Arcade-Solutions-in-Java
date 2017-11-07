/*Please add ; after each select statement*/
CREATE PROCEDURE placesOfInterestPairs()
BEGIN
	SELECT s1.name AS place1, s2.name AS place2 FROM sights AS s1 CROSS JOIN sights AS s2
    ON s1.name < s2.name 
    WHERE SQRT(POW(s1.x - s2.x, 2) + POW(s1.y - s2.y, 2)) < 5
    ORDER BY s1.name, s2.name;
END


/* BETTER */
/*Please add ; after each select statement*/
CREATE PROCEDURE localCalendar()
BEGIN
    select event_id, 
           date_format(
               date_add(date, interval timeshift minute),
               if(hours = 24, "%Y-%m-%d %k:%i", "%Y-%m-%d %I:%i %p")
           ) formatted_date
        from events, settings
        where events.user_id = settings.user_id;
END