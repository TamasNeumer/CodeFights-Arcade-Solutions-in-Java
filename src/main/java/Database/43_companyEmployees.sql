/*Please add ; after each select statement*/
CREATE PROCEDURE companyEmployees()
BEGIN
	SELECT * FROM departments CROSS JOIN employees
    ORDER BY departments.dep_name, employees.emp_name;
END