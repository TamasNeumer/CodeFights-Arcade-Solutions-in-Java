/*Please add ; after each select statement*/
CREATE PROCEDURE sunnyHolidays()
BEGIN
	SELECT holiday_date AS ski_date FROM holidays
    INNER JOIN weather ON holidays.holiday_date = weather.sunny_date;
END