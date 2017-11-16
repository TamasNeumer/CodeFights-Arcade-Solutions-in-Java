/*Please add ; after each select statement*/
CREATE PROCEDURE battleshipGameResults()
BEGIN
    SELECT size, SUM(undamaged) as undamaged, SUM(partly_damaged) as partly_damaged, SUM(sunk) as sunk FROM
    (
    
    SELECT *, 
        IF(SUM(hit) = size, 1, 0) as sunk,
        IF(IF(SUM(hit) = size, 1, 0) = 0 AND SUM(hit) > 0, 1, 0) as partly_damaged,
        IF(IF(SUM(hit) = size, 1, 0) = 0 AND IF(IF(SUM(hit) = size, 1, 0) = 0 AND SUM(hit) > 0, 1, 0) = 0, 1, 0) as undamaged,
        SUM(hit) as hits
    FROM
    (    
    SELECT 
        los.id, los.upper_left_x, los.upper_left_y, los.bottom_right_x, los.bottom_right_y,
        os.target_x, os.target_y,
        IF(upper_left_x = bottom_right_x, ABS(upper_left_y - bottom_right_y) + 1,
          ABS(upper_left_x - bottom_right_x) +1) as size,
        IF(os.target_x >= los.upper_left_x AND os.target_x <= los.bottom_right_x
          AND os.target_y >= los.upper_left_y AND os.target_y <= los.bottom_right_y,
          1, 0) as hit
    FROM locations_of_ships AS los
    CROSS JOIN opponents_shots as os ON (os.target_x * 1000) > (los.upper_left_x)
    ) as s1
    GROUP BY 1
    
    ) as s1
    GROUP by size
    ORDER by size;

END