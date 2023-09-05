/*
Please write a SQL statement to see restaurants are grouping by visits and by orders and joined with each other by using restaurant name.  
You can use internal SQLs from Exercise 02 (restaurants by visits and by orders) without limitations of amount of rows.

Additionally, please add the next rules.
- calculate a sum of orders and visits for corresponding pizzeria (be aware, not all pizzeria keys are presented in both tables).
- sort results by `total_count` column in descending mode and by `name` in ascending mode.
Take a look at the data sample below.

*/

WITH stat_order AS (
SELECT pizzeria.name AS name, count(pizzeria.name) AS count
FROM pizzeria
JOIN menu ON pizzeria.id = menu.pizzeria_id
JOIN person_order ON person_order.menu_id = menu.id
GROUP BY name
ORDER BY count DESC),

stat_visit AS (SELECT pizzeria.name AS name, count(pizzeria.name) AS count
FROM pizzeria
JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
GROUP BY name
ORDER BY count DESC),

union_stat AS(
SELECT name FROM stat_order
UNION ALL
SELECT name FROM stat_visit
),
group_stat AS (
SELECT name FROM union_stat
GROUP BY union_stat.name
)
SELECT group_stat.name AS name, COALESCE(stat_order.count, 0) + stat_visit.count AS total_count FROM group_stat
FULL JOIN stat_visit ON group_stat.name = stat_visit.name
FULL JOIN stat_order ON group_stat.name = stat_order.name
ORDER BY total_count DESC, name;


