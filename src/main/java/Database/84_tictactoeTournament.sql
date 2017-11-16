/* FROM https://codefights.com/challenge/XYuNi4cW3L7hQFB3T */
CREATE PROCEDURE tictactoeTournament()
    SELECT
        ELT(d, name_naughts, name_crosses) name,
        sum((r=d)*2 + (r=3)) points,
        sum(1) played,
        sum(r=d) won,
        sum(r=3) draw,
        sum(r=3-d) lost
    FROM
        (SELECT
            *,
            IF(board RLIKE '^(...)*XXX|X..(X|.X.)..X|^..X.X.X', 2, 
                LENGTH(REPLACE(board, '.', ''))%2*2+1
            ) r
        FROM results) x,
        (SELECT 1 d UNION SELECT 2) b
    GROUP BY 1
    ORDER BY
        2 DESC,
        3,
        5,
        1





/*EXTREME LONG SOLUTION*/



/*Please add ; after each select statement*/
CREATE PROCEDURE tictactoeTournament()
BEGIN
    SET @xwin := ('(XXX[XO\.]{6})|([XO\.]{3}XXX[XO\.]{3})|([XO\.]{6}XXX)|(X[XO\.]{2}X[XO\.]{2}X[XO\.]{2})|([XO\.]X[XO\.][XO\.]X[XO\.][XO\.]X[XO\.])|([XO\.]{2}X[XO\.]{2}X[XO\.]{2}X)|(X[XO\.]{3}X[XO\.]{3}X)|([XO\.]{2}X[XO\.]X[XO\.]X[XO\.]{2})');

    SET @owin = ('(OOO[XO\.]{6})|([XO\.]{3}OOO[XO\.]{3})|([XO\.]{6}OOO)|(O[XO\.]{2}O[XO\.]{2}O[XO\.]{2})|([XO\.]O[XO\.][XO\.]O[XO\.][XO\.]O[XO\.])|([XO\.]{2}O[XO\.]{2}O[XO\.]{2}O)|(O[XO\.]{3}O[XO\.]{3}O)|([XO\.]{2}O[XO\.]O[XO\.]O[XO\.]{2})');

SELECT name, (SUM(xwon) + SUM(owon)) *2 + SUM(draw) as points, COUNT(name) as played, SUM(xwon) + SUM(owon) as won, SUM(draw) as draw, COUNT(name) - SUM(xwon)  - SUM(owon) - SUM(draw) as lost FROM
(
SELECT name_crosses as name, xwon, owon, draw FROM 
(
SELECT *, board REGEXP @xwin as xwon, board REGEXP @owin as owon, board REGEXP @owin = 0 AND board REGEXP @xwin = 0 as draw from results
) as a
WHERE xwon = 1

UNION ALL

SELECT name_naughts as name, xwon, owon, draw FROM 
(
SELECT *, board REGEXP @xwin as xwon, board REGEXP @owin as owon, board REGEXP @owin = 0 AND board REGEXP @xwin = 0 as draw from results
) as b
WHERE owon = 1

UNION ALL

SELECT name_naughts as name, xwon, owon, draw FROM 
(
SELECT *, board REGEXP @xwin as xwon, board REGEXP @owin as owon, board REGEXP @owin = 0 AND board REGEXP @xwin = 0 as draw from results
) as c
WHERE draw = 1

UNION ALL

SELECT name_crosses as name, xwon, owon, draw FROM 
(
SELECT *, board REGEXP @xwin as xwon, board REGEXP @owin as owon, board REGEXP @owin = 0 AND board REGEXP @xwin = 0 as draw from results
) as d
WHERE draw = 1

UNION ALL

SELECT name_crosses as name, 0 as xwon, 0 as owon, 0 as draw FROM 
(
SELECT *, board REGEXP @xwin as xwon, board REGEXP @owin as owon, board REGEXP @owin = 0 AND board REGEXP @xwin = 0 as draw from results
) as e
WHERE owon = 1

UNION ALL

SELECT name_naughts as name, 0 as xwon, 0 as owon, 0 as draw FROM 
(
SELECT *, board REGEXP @xwin as xwon, board REGEXP @owin as owon, board REGEXP @owin = 0 AND board REGEXP @xwin = 0 as draw from results
) as f
WHERE xwon = 1
) as h
GROUP BY name
ORDER BY points DESC, played ASC, won DESC, name ASC;

END