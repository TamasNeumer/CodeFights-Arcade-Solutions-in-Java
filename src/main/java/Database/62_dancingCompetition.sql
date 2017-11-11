/*Please add ; after each select statement*/
CREATE PROCEDURE dancingCompetition()
BEGIN
    create or replace view z(a,b,c,d) as select * from scores;
    select a.*
        from scores a, z
        group by 1
        having (first_criterion  in (min(b), max(b)))
             + (second_criterion in (min(c), max(c)))
             + (third_criterion  in (min(d), max(d))) < 2;
END


/*OVERKILL SOLUTION*/
/*Please add ; after each select statement*/
CREATE PROCEDURE dancingCompetition()
BEGIN
SELECT arbiter_id, first_criterion,second_criterion,third_criterion FROM(
SELECT *, COUNT(arbiter_id) as occurrence FROM
(
    select DISTINCT *, 1 as ordinal
    from scores 
    where 
        first_criterion = (select min(first_criterion) from scores) OR
        first_criterion = (select max(first_criterion) from scores)
    UNION ALL
    select DISTINCT * , 2 as ordinal
    from scores 
    where 
        second_criterion = (select min(second_criterion) from scores) OR
        second_criterion = (select max(second_criterion) from scores)
    UNION ALL
    select DISTINCT * , 3 as ordinal
    from scores 
    where 
        third_criterion = (select min(third_criterion) from scores) OR
        third_criterion = (select max(third_criterion) from scores)
    UNION ALL 
    select DISTINCT * , 4 as ordinal
    from scores 
    where 
        first_criterion != (select min(first_criterion) from scores) AND
        first_criterion != (select max(first_criterion) from scores) AND
        second_criterion != (select min(second_criterion) from scores) AND
        second_criterion != (select max(second_criterion) from scores) AND
        third_criterion != (select min(third_criterion) from scores) AND
        third_criterion != (select max(third_criterion) from scores)
) as solution
GROUP BY arbiter_id
ORDER BY ordinal
) as final
WHERE occurrence < 2;


END