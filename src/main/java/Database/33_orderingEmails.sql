/*Please add ; after each select statement*/
CREATE PROCEDURE orderingEmails()
BEGIN
    SELECT id, 
           email_title, 
           if(size >> 20 > 0,
              concat_ws(' ', size >> 20, 'Mb'),
              concat_ws(' ', size >> 10, 'Kb')
           ) short_size
        FROM emails
        ORDER BY size DESC;
END
