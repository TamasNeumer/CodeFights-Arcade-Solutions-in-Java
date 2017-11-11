/*Please add ; after each select statement*/
CREATE PROCEDURE holidayEvent()
BEGIN
	SET @a = 0;
    SELECT DISTINCT buyer_name AS winners FROM(
        SELECT *, @a:=@a + 1 AS buyerNumber FROM purchases
    ) as solution
    WHERE buyerNumber % 4 = 0
    ORDER BY winners;
END