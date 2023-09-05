/*
Please write a SQL statement that returns the person name and corresponding number of visits in any pizzerias if the person has visited more than 3 times (> 3).
Please take a look at the sample of data below.
*/

WITH stat AS (
SELECT person.name AS name, count(pizzeria.name) AS count_of_visits
FROM person
JOIN person_visits ON person.id = person_visits.person_id
JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY person.name
HAVING count(pizzeria.name) > 3
)

SELECT * FROM stat;