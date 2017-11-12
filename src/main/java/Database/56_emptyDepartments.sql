/*Please add ; after each select statement*/
CREATE PROCEDURE emptyDepartments()
BEGIN
    SELECT
        departments.`dep_name`
    FROM
        departments
    LEFT JOIN
        employees ON(employees.`department` = departments.`id`)
    WHERE
        employees.`department` <=> NULL;
END