/* FROM https://codefights.com/challenge/mNA5GsdheBHoWKfAY/solutions/9EwBMnRbAb9if4372 */
CREATE PROCEDURE typeInheritance()
BEGIN

    CREATE TABLE v
        SELECT *, type t FROM variables;
     
    WHILE row_count() DO

        UPDATE v
        JOIN inheritance
            ON t = derived
            && t != @n:="Number"
        SET t = base
        ;

    END WHILE;

    SELECT var_name, type var_type
    from v
    where t = @n
        && type != t
        ;

    DROP TABLE v;

END