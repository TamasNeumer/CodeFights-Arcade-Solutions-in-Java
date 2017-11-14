/*Please add ; after each select statement*/

DROP FUNCTION IF EXISTS fromRoman;
CREATE FUNCTION fromRoman (inRoman varchar(15)) RETURNS integer DETERMINISTIC
BEGIN

    DECLARE numeral CHAR(7) DEFAULT 'IVXLCDM';

    DECLARE digit TINYINT;
    DECLARE previous INT DEFAULT 0;
    DECLARE current INT;
    DECLARE sum INT DEFAULT 0;

    SET inRoman = UPPER(inRoman);

    WHILE LENGTH(inRoman) > 0 DO
        SET digit := LOCATE(RIGHT(inRoman, 1), numeral) - 1;
        SET current := POW(10, FLOOR(digit / 2)) * POW(5, MOD(digit, 2));
        SET sum := sum + POW(-1, current < previous) * current;
        SET previous := current;
        SET inRoman = LEFT(inRoman, LENGTH(inRoman) - 1);
    END WHILE;

    RETURN sum;
END;


CREATE PROCEDURE sortBookChapters()
BEGIN
    SELECT chapter_name FROM
	(SELECT chapter_name, fromRoman(chapter_number) as decinum FROM book_chapters
    ORDER BY decinum) as a;
END;