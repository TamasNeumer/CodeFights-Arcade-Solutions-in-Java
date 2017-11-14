/*Please add ; after each select statement*/
CREATE PROCEDURE unluckyEmployees()
BEGIN

    
    SET @x := 0;

    SELECT dep_name, emp_number,total_salary FROM
    (SELECT (@x:=@x+1) AS id, dep_name, emp_number, total_salary FROM 
    (SELECT 
        Department.name as dep_name,
        IF(Employee.salary = NULL, 0, COUNT(Employee.salary)) as emp_number,
        SUM(IFNULL(Employee.salary, 0)) as total_salary FROM Department
    LEFT JOIN Employee ON Employee.department = Department.id
    GROUP BY Department.name
    ORDER BY total_salary DESC, emp_number DESC, Department.id ASC) as derived
    WHERE emp_number < 6) AS damnit
    where id % 2 = 1;

    /*SET @x := 0;

    SELECT dep_name, emp_number,total_salary FROM
    (SELECT (@x:=@x+1) AS id, dep_name, emp_number, total_salary FROM 
    (SELECT
        Department.name as dep_name,
        COUNT(Employee.salary) as emp_number,
        SUM(Employee.salary) as total_salary FROM Employee
    JOIN Department ON Employee.department = Department.id
    GROUP BY Department.name
    ORDER BY total_salary DESC, emp_number DESC, Department.id ASC) as derived
    WHERE emp_number < 6) AS damnit
    where id % 2 = 1;*/
END