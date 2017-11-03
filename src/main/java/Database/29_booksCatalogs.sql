/*Please add ; after each select statement*/
CREATE PROCEDURE booksCatalogs()
BEGIN
	SELECT DISTINCT ExtractValue(xml_doc, '/descendant-or-self::author[1]') AS author FROM catalogs 
    ORDER BY author;
END