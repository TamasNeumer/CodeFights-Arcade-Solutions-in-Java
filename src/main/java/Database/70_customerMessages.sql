DROP FUNCTION IF EXISTS response;
CREATE FUNCTION response(name VARCHAR(40)) RETURNS VARCHAR(200) DETERMINISTIC
BEGIN
    return 
            concat(
                'Dear ',
                left(@uppercase_name:=ucase(@lowercase_name:=lcase(name)), 1),
                substr(@lowercase_name, 2, @indexOfSpaceInName:=instr(@lowercase_name, ' ') - 1),
                substr(@uppercase_name, @indexOfSpaceInName + 2, 1),
                substr(@lowercase_name, @indexOfSpaceInName + 3),
                '! We received your message and will process it as soon as possible. Thanks for using our service. FooBar On! - FooBarIO team.');
END;

CREATE PROCEDURE customerMessages()
BEGIN
    SELECT id, name, response(name) AS response
    FROM customers;
END;
