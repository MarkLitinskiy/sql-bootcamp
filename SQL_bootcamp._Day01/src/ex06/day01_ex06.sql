/*
 Let's return our mind back to exercise #03 and change our SQL statement to return person
 names instead of person identifiers and change ordering by action_date in ascending mode
 and then by person_name in descending mode. Please take a look at a data sample below.
*/
SELECT order_date AS action_date, (SELECT name FROM person WHERE person_order.person_id = person.id) AS person_name
FROM person_order
INTERSECT
SELECT visit_date, (SELECT name FROM person WHERE person_visits.person_id = person.id)
FROM person_visits
ORDER BY action_date, person_name DESC;