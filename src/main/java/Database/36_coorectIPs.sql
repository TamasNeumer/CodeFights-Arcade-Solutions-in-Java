/*Please add ; after each select statement*/
CREATE PROCEDURE correctIPs()
BEGIN
	SELECT id, ip from ips WHERE 
        (ip REGEXP '(^[1-9]{2}\.([0-2]?[0-9]?[0-9]\.){2}[0-2]?[0-9]?[0-9]$)|(^[0-2]?[0-9]?[0-9]\.[1-9]{2}\.[0-2]?[0-9]?[0-9]\.[0-2]?[0-9]?[0-9]$)|(^([0-2]?[0-9]?[0-9]\.){2}[1-9]{2}\.[0-2]?[0-9]?[0-9]$)|(^([0-2]?[0-9]?[0-9]\.){3}[0-9]{2}$)' = 1) ORDER BY id;
END

/*OR*/
/*Please add ; after each select statement*/
CREATE PROCEDURE correctIPs()
BEGIN
	SELECT id, ip from ips WHERE 
        (ip REGEXP '^([0-2]?[0-9]?[0-9]\.){2}([1-9]{2}\.[0-2]?[0-9]?[0-9]|[0-2]?[0-9]?[0-9]\.[0-9]{2})$' = 1) ORDER BY id;
END