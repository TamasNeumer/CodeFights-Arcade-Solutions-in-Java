/*Please add ; after each select statement*/
CREATE PROCEDURE suspectsInvestigation()
BEGIN
	SELECT id, name, surname FROM Suspect
    WHERE (
        height <= 170 AND
        name LIKE 'B%' AND
        surname LIKE 'Gre_n'
    );
END