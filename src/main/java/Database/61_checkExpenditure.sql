/*Please add ; after each select statement*/
CREATE PROCEDURE checkExpenditure()
BEGIN
    SELECT id, IF(value > loss, 0, loss-value) as loss FROM
    ( 
        SELECT id,
        (SELECT SUM(expenditure_sum) 
             FROM expenditure_plan
             WHERE WEEK(monday_date) >= ae.left_bound AND WEEK(monday_date) <= ae.right_bound
        ) as loss,
        value
        FROM allowable_expenditure as ae
    ) as solution;
END