/*Please add ; after each select statement*/
CREATE PROCEDURE storageOptimization()
BEGIN
SELECT solution.id, solution.column_name, solution.value FROM
(
    SELECT id, 'name' AS column_name, name AS value
        FROM workers_info
        WHERE name IS NOT NULL
    UNION ALL
    SELECT id, 'date_of_birth' as column_name, date_of_birth as value
        FROM workers_info
        WHERE date_of_birth IS NOT NULL
    UNION ALL
    SELECT id, 'salary' as column_name, salary as value
        FROM workers_info
        WHERE salary IS NOT NULL
) as solution
ORDER BY solution.id, FIELD(solution.column_name, 'name', 'date_of_birth', 'salary');
END