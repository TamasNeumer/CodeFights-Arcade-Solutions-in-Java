	SELECT Name, ID FROM Grades
    WHERE (
        (0.25 * Midterm1 + 0.25 * Midterm2 + 0.5 * Final < Final) AND
        (0.5 * Midterm1 + 0.5 * Midterm2 < Final)
    )
    ORDER BY LEFT(Name, 3), ID;

    /*OR*/

	select Name, ID from Grades
    where 2 * final > midterm1 + midterm2
    order by left(name, 3) asc, id asc;
