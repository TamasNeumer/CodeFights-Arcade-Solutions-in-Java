/*Please add ; after each select statement*/
CREATE PROCEDURE securityBreach()
BEGIN
	SELECT * FROM users
    WHERE
        attribute LIKE CONCAT('%_\%',first_name,'_',second_name,'\%%') COLLATE utf8_bin
    ORDER BY attribute;
END