/*Please add ; after each select statement*/
CREATE PROCEDURE queriesExecution()
BEGIN
    set @a = concat((select group_concat(concat('select "', query_name, '" query_name, (', code, ') val') separator ' union ') from queries), ' order by 1');

/* you'll get the following sql in @a, for example test 1:
select "AVG_EXEC_PRICE" query_name, (SELECT AVG(execution_price) FROM `execution`) val 
union
select "COUNT_EXECUTIONS" query_name, (SELECT COUNT(execution_id) FROM `execution`) val
union
select "MIN_ORDER_DATE" query_name, (SELECT MIN(date_placed) FROM `orders`) val
union
select "SUM_ORD_QTY" query_name, (SELECT SUM(order_qty) FROM `orders`) val
order by 1
*/

    prepare qry from @a;
    execute qry;
END