/*Please add ; after each select statement*/
CREATE PROCEDURE alarmClocks()
BEGIN
    select @a alarm_date
        from userInput, 
             (select 1 union select 2 union select 3 union select 4) x,
             (select 1 union select 2 union select 3 union select 4) y,
             (select 1 union select 2 union select 3 union select 4) z
        where year(ifnull(@a:=date_add(@a, interval 1 week), @a:=input_date)) 
            = year(input_date);
END


/*OR*/
/*Please add ; after each select statement*/
CREATE PROCEDURE alarmClocks()
BEGIN
    SET @date := (SELECT input_date FROM userInput);
    SET @initial := @date;

    DROP TABLE IF EXISTS alarmList;
    CREATE TABLE alarmList
    (
        alarm_date datetime
    );
    
	WHILE YEAR(@date) = YEAR(@initial) DO
        INSERT INTO alarmList ( alarm_date )
            SELECT @date;
        SET @date := @date + INTERVAL 7 DAY;
    END WHILE;
    
    SELECT *
    FROM alarmList;
END