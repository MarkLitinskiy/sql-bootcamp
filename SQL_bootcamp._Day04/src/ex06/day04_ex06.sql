/*
Please create a Materialized View mv_dmitriy_visits_and_eats (with data included) based on SQL statement
that finds the name of pizzeria Dmitriy visited on January 8, 2022 and could eat pizzas 
for less than 800 rubles (this SQL you can find out at Day #02 Exercise #07).

To check yourself you can write SQL to Materialized View mv_dmitriy_visits_and_eats and 
compare results with your previous query.
*/

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pizzeria.name AS pizzeria_name
FROM (SELECT * FROM person WHERE name = 'Dmitriy') AS p
JOIN (SELECT * FROM person_visits WHERE visit_date = '2022-01-08') AS pv ON p.id = pv.person_id
JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
JOIN (SELECT * FROM menu WHERE menu.price < 800) AS m ON m.pizzeria_id = pizzeria.id;
