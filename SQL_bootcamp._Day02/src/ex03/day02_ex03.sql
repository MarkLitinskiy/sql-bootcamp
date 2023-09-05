/*
Let’s return back to Exercise #01, please rewrite your SQL by using the CTE 
(Common Table Expression) pattern. Please move into the CTE part of your "day generator". 
The result should be similar like in Exercise #01
*/
WITH gs AS (
   SELECT generate_series('2022-01-01':: date
   , '2022-01-10':: date
   , interval '1 day') AS date
    )
SELECT date::date AS missing_date
FROM gs
LEFT JOIN (SELECT visit_date FROM person_visits WHERE person_visits.person_id = 1 OR person_visits.person_id = 2) AS visit
ON visit.visit_date = gs.date
WHERE visit.visit_date is null;