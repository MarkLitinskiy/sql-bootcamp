/*
Please write a SQL statement to see 3 favorite restaurants by visits and by orders in one list (please add an action_type column with values ‘order’ or ‘visit’, it depends on data from the corresponding table). 
Please take a look at the sample of data below. 
The result should be sorted by action_type column in ascending mode and by count column in descending mode.
*/
WITH stat_order AS (
SELECT pizzeria.name AS name, count(pizzeria.name) AS count, 'order' AS action_type
FROM pizzeria
JOIN menu ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON person_order.menu_id = menu.id
GROUP BY name
ORDER BY count DESC
LIMIT 3),

stat_visit AS (SELECT pizzeria.name AS name, count(pizzeria.name) AS count, 'visit' AS action_type
FROM pizzeria
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY count DESC
LIMIT 3)

SELECT * FROM stat_order
UNION
SELECT * FROM stat_visit
ORDER BY action_type, count DESC;