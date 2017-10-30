DROP TABLE IF EXISTS Projects;

CREATE TABLE Projects (
	internal_id int UNIQUE,
	project_name varchar(255),
	team_size int,
	team_lead varchar(255),
	income int);

INSERT INTO Projects VALUES
(1384, 'MapReduce', 100, 'Jeffrey Dean', 0),
(2855, 'Windows', 1000, 'Bill Gates', 100500),
(5961,	'Snapchat', 3, 'Evan Spiegel',	2000);

SELECT* FROM PROJECTS;

/*SOLUTION*/
SELECT project_name, team_lead, income FROM Projects ORDER BY (internal_id);