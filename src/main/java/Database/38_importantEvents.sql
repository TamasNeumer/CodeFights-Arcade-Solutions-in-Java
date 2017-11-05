/*Please add ; after each select statement*/
CREATE PROCEDURE importantEvents()
BEGIN
	select id, name, event_date, participants
    from events
    order by weekday(event_date), participants DESC;
END