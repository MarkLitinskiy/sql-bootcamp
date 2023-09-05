/*
Please write a SQL statement which returns the missing days from 1st to 10th of January 2022 
(including all days) for visits of persons with identifiers 1 or 2 (it means days missed 
by both). Please order by visiting days in ascending mode. The sample of data with column 
name is presented below.
*/
SELECT missing_date::date
FROM generate_series ('2022-01-01'::date,'2022-01-10'::date, interval '1 day') AS date(missing_date)
LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_visits.person_id = 1 OR person_visits.person_id = 2) AS visit
ON visit.visit_date = date.missing_date
WHERE visit.visit_date is null;