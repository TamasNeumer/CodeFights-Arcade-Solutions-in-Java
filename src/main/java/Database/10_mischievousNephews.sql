   SELECT (CASE DAYNAME(mischief_date)
              WHEN 'Monday' THEN 0
              WHEN 'Tuesday' THEN 1
              WHEN 'Wednesday' THEN 2
              WHEN 'Thursday' THEN 3
              WHEN 'Friday' THEN 4
              WHEN 'Saturday' THEN 5
              WHEN 'Sunday' THEN 6
           END) as weekday, mischief_date, author, title FROM mischief
   ORDER BY weekday, FIELD(author, 'Huey','Dewey','Louie'), mischief_date, title;  