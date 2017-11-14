/*Not a nice solution: Extra columsn with "0" added just to make UNION wor*/
/*Please add ; after each select statement*/
CREATE PROCEDURE driversInfo()
BEGIN
	select summary from 
    (select 
        driver_name a, 
        @a:=date b, 
        concat('  date: ', @a, '; miles covered: ', miles_logged) summary
    from inspections
    union
    select 
        @a:=driver_name, 
        0, 
        concat(' Name: ', @a, '; number of inspections: ', sum(1), 
               '; miles driven: ', sum(miles_logged))
    from inspections 
    group by 1
    union
    select 
        0, 
        0, 
        concat(' Total miles driven by all drivers combined: ', sum(miles_logged))
    from inspections) x
    order by a, b;
END

/*
With selecting all it looks like:
a       b           summary
0       0           Total miles driven by all drivers combined: 742
Dave    0           Name: Dave; number of inspections: 3; miles driven: 456
Dave    2014-01-16  date: 2014-01-16; miles covered: 45
Dave    2014-01-17  date: 2014-01-17; miles covered: 180
Dave    2014-01-18  date: 2014-01-18; miles covered: 231
Gary    0           Name: Gary; number of inspections: 2; miles driven: 286
Gary    2014-02-03  date: 2014-02-03; miles covered: 30
Gary    2014-03-15  date: 2014-03-15; miles covered: 256
*/