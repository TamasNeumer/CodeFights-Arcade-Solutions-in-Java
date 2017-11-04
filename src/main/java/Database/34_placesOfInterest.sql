/*Please add ; after each select statement*/
CREATE PROCEDURE placesOfInterest()
BEGIN
	SELECT
        country, 
          SUM(IF(leisure_activity_type = 'Adventure park',number_of_places,0)) as adventure_park,
          SUM(IF(leisure_activity_type = 'Golf',number_of_places,0)) as golf,
          SUM(IF(leisure_activity_type = 'River cruise',number_of_places,0)) as river_cruise,
          SUM(IF(leisure_activity_type = 'Kart racing',number_of_places,0)) as kart_racing
        FROM countryActivities
  group by country;
END