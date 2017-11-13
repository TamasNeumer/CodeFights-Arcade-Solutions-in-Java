/*Please add ; after each select statement*/
CREATE PROCEDURE bugsInComponent()
BEGIN
	  SELECT
            Bug.title AS bug_title,
            Component.title AS component_title,
           (SELECT sum(1) FROM BugComponent WHERE component_id=id) AS bugs_in_component
        FROM Bug, Component, BugComponent
        WHERE bug_num=num
              AND component_id=id
              AND (SELECT sum(1) FROM BugComponent WHERE bug_num=num)>1
        ORDER BY 3 DESC, id, num;
END