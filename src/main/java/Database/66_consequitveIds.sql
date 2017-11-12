/*Please add ; after each select statement*/
CREATE PROCEDURE consecutiveIds()
BEGIN
	DROP TABLE IF EXISTS new_ids;
    
    CREATE TABLE new_ids (oldId INT NOT NULL, newId int not null AUTO_INCREMENT, PRIMARY KEY(newId) );
    
    INSERT INTO new_ids
    SELECT id , NULL
    FROM itemIds;

    SELECT * FROM new_ids;
END


/*SHORT*/
/*Please add ; after each select statement*/
CREATE PROCEDURE consecutiveIds()
BEGIN
    select id AS oldId, @a:=@a + 1 AS newId
    from itemIds, (select @a:=0) y;
END