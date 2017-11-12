DROP PROCEDURE IF EXISTS orderAnalytics;
CREATE PROCEDURE orderAnalytics()
BEGIN
    CREATE OR REPLACE VIEW order_analytics AS
    SELECT 
        id,
        YEAR(order_date) as year,
        QUARTER(order_date) as quarter,
        type,
        price * quantity as total_price
    FROM orders
    ORDER BY id;

    SELECT *
    FROM order_analytics
    ORDER by id;
END;
