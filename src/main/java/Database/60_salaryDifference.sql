/*Please add ; after each select statement*/
CREATE PROCEDURE salaryDifference()
BEGIN
    select ifnull(sum(salary * count), 0) difference
        from ((select salary, count(id) count 
                   from employees 
                   group by salary 
                   order by salary desc
                   limit 1
              )
              union
              (select -salary, count(id) 
                   from employees 
                   group by salary 
                   order by salary 
                   limit 1
              )
             ) y;
END


/* Shitty solution */
/*Please add ; after each select statement*/
CREATE PROCEDURE salaryDifference()
BEGIN
    SET @max = (SELECT MAX(salary) FROM employees);
    SET @min = (SELECT MIN(salary) FROM employees);
	
    SET @min_sum = (SELECT SUM(salary) as sum_min FROM
        (SELECT salary FROM employees where salary = @min) as asd1);

    SET @max_sum = (SELECT SUM(salary) as sum_max FROM
        (SELECT salary FROM employees where salary = @max) as asd2);
    
    SELECT IF(ROUND((@max_sum - @min_sum)) IS NULL, 0, ROUND((@max_sum - @min_sum))) as difference;
END