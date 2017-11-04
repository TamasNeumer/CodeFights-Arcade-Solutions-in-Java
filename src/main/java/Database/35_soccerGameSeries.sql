CREATE PROCEDURE soccerGameSeries()
BEGIN
	SET @firstwins = (SELECT COUNT(match_id) FROM scores WHERE first_team_score > second_team_score);
    SET @secondwins = (SELECT COUNT(match_id) FROM scores WHERE first_team_score < second_team_score);
    SET @firstoverall = (SELECT SUM(first_team_score) FROM scores);
    SET @secondoverall = (SELECT SUM(second_team_score) FROM scores);
    SET @firstscoreaway = (SELECT SUM(first_team_score) FROM scores WHERE match_host = '2');
    SET @secondscoreaway = (SELECT SUM(second_team_score) FROM scores WHERE match_host = '1');
    
    SELECT IF(@firstwins > @secondwins, '1', 
             IF(@firstwins < @secondwins, '2',
               IF(@firstoverall > @secondoverall, '1', 
                 IF(@firstoverall < @secondoverall, '2',
                   IF(@firstscoreaway > @secondscoreaway, '1',
                     iF(@firstscoreaway < @secondscoreaway, '2', '0'))))))
    AS winner FROM scores GROUP BY winner;
END

/*BETTER*/
/*Please add ; after each select statement*/
CREATE PROCEDURE soccerGameSeries()
BEGIN
    SELECT
        CASE
            WHEN stats.`first_team_wins` > stats.`second_team_wins` THEN 1
            WHEN stats.`second_team_wins` > stats.`first_team_wins` THEN 2
            WHEN stats.`goal_diff` > 0 THEN 1
            WHEN stats.`goal_diff` < 0 THEN 2
            WHEN stats.`first_team_points` > stats.`second_team_points` THEN 1
            WHEN stats.`second_team_points` > stats.`first_team_points` THEN 2
            ELSE 0
        END AS `winner`
    FROM
    (
        SELECT
            SUM(scores.`first_team_score` > scores.`second_team_score`) `first_team_wins`,
            SUM(scores.`first_team_score` < scores.`second_team_score`) `second_team_wins`,
            SUM(scores.`first_team_score` - scores.`second_team_score`) `goal_diff`,
            SUM((scores.`match_host` = 2) * scores.`first_team_score`) `first_team_points`,
            SUM((scores.`match_host` = 1) * scores.`second_team_score`) `second_team_points`
        FROM
            scores
    ) AS stats;
END

/* OR*/
CREATE PROCEDURE soccerGameSeries()
SELECT CASE
    WHEN w1 > w2 THEN 1
    WHEN w1 < w2 THEN 2
    WHEN s1 > s2 THEN 1
    WHEN s1 < s2 THEN 2
    WHEN a1 > a2 THEN 1
    WHEN a1 < a2 THEN 2
    ELSE              0
       END AS winner
FROM (
    SELECT SUM(  first_team_score > second_team_score )    AS w1,
           SUM(  first_team_score < second_team_score )    AS w2,
           SUM(  first_team_score )                        AS s1,
           SUM( second_team_score )                        AS s2,
           SUM( IF(match_host = 2,  first_team_score, 0) ) AS a1,
           SUM( IF(match_host = 1, second_team_score, 0) ) AS a2
    FROM   scores
) AS t1