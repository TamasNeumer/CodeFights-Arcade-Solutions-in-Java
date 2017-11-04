DROP PROCEDURE IF EXISTS legsCount;
CREATE PROCEDURE legsCount()
    SELECT SUM(
        CASE type
    WHEN 'human' THEN 2
    WHEN 'cat'  THEN 4
    WHEN 'dog' THEN 4
        END) as summary_legs
    FROM creatures
    ORDER BY id;
