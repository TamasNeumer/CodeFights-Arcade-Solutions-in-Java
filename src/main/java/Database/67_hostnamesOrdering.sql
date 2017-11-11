/*Please add ; after each select statement*/
CREATE PROCEDURE hostnamesOrdering()
BEGIN
	SELECT * FROM hostnames 
    ORDER BY 
        reverse(SUBSTRING_INDEX(reverse(hostname), '.', 1)), 
        reverse(SUBSTRING_INDEX(reverse(CONCAT('.', hostname)), '.', 2)), 
        hostname,
        reverse(hostname)
;
END