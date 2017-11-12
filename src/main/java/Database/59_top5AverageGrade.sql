/*Please add ; after each select statement*/
CREATE PROCEDURE top5AverageGrade()
BEGIN
	SELECT FORMAT(AVG(grade),2) AS average_grade 
	FROM (SELECT grade FROM students ORDER BY grade DESC LIMIT 5) AS innert;
END