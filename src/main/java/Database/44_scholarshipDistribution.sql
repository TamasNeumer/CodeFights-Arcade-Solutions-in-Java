/*Please add ; after each select statement*/
CREATE PROCEDURE scholarshipsDistribution()
BEGIN
	SELECT candidate_id as student_id FROM candidates LEFT JOIN detentions ON
    candidates.candidate_id = detentions.student_id
    WHERE detention_date IS NULL;
END