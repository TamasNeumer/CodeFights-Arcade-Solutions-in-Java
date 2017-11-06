/*Please add ; after each select statement*/
CREATE PROCEDURE netIncome()
BEGIN
	SELECT 
        YEAR(date) AS year, 
        QUARTER(date) AS quarter, 
        SUM(CAST(profit AS signed) - CAST(loss AS signed)) AS net_profit 
    FROM accounting
    GROUP BY year, quarter
    ORDER BY year ASC, quarter ASC;
END