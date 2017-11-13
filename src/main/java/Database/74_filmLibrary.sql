/*Please add ; after each select statement*/
CREATE PROCEDURE filmLibrary()
BEGIN
    SET @favgenre = (SELECT genre FROM
        (SELECT genre, COUNT(*) AS magnitude 
            FROM movies 
            GROUP BY genre 
            ORDER BY magnitude DESC
            LIMIT 1) AS table1);

    SELECT actor_ages.actor, actor_ages.age FROM starring_actors LEFT JOIN movies ON movies.movie = starring_actors.movie_name
    LEFT JOIN actor_ages ON starring_actors.actor = actor_ages.actor
    WHERE genre = @favgenre
    ORDER BY actor_ages.age DESC, actor_ages.actor;
END