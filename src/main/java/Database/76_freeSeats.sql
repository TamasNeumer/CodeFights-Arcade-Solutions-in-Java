/*Please add ; after each select statement*/
CREATE PROCEDURE freeSeats()
BEGIN
    SELECT flights.flight_id, planes.number_of_seats -
        IFNULL(total.total_purchase,0) AS free_seats FROM flights
    LEFT JOIN planes ON flights.plane_id = planes.plane_id
    LEFT JOIN (
        SELECT flight_id, COUNT(flight_id) as total_purchase FROM purchases
        GROUP BY flight_id
    ) AS total ON total.flight_id = flights.flight_id
    ORDER BY flights.flight_id;
END

/*OR*/
/*Please add ; after each select statement*/
CREATE PROCEDURE freeSeats()
BEGIN
	select flights.flight_id,
           number_of_seats - sum(seat_no is not null) free_seats
        from flights
             join planes on flights.plane_id = planes.plane_id
             left join purchases on flights.flight_id = purchases.flight_id
        group by flights.flight_id;
END