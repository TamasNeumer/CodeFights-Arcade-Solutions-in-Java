/*Please add ; after each select statement*/
CREATE PROCEDURE nullIntern()
BEGIN
	SELECT COUNT(*) AS number_of_nulls FROM departments
    WHERE
        TRIM(LOWER(description)) LIKE 'null' OR
        TRIM(LOWER(description)) LIKE 'nil' OR
        TRIM(LOWER(description)) LIKE '-' OR
        description IS NULL;
END