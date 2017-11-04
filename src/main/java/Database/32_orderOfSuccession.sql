/*Please add ; after each select statement*/
CREATE PROCEDURE orderOfSuccession()
BEGIN
	SELECT 
           CASE gender
                WHEN 'F' THEN CONCAT('Queen ', name)
                WHEN 'M' THEN CONCAT('King ', name)
           END
     AS name FROM Successors ORDER BY birthday;
END