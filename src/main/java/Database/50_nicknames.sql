CREATE PROCEDURE nicknames()
BEGIN
	UPDATE reservedNicknames
    SET id = CONCAT('rename - ',id), nickname = CONCAT('rename - ', nickname)
    WHERE LENGTH(nickname) <> 8;

    SELECT * FROM reservedNicknames ORDER BY id;
END
