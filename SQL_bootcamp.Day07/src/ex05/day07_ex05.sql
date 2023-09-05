/*
Please write a simple SQL query that returns a list of unique person names who made orders in any pizzerias. The result should be sorted by person name. 
Please take a look at the sample below.
*/

SELECT DISTINCT (SELECT name FROM person WHERE person.id = person_order.person_id) AS name
FROM person_order
ORDER BY name;