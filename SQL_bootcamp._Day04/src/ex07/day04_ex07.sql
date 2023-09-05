/*
Let's refresh data in our Materialized View mv_dmitriy_visits_and_eats from exercise #06. 
Before this action, please generate one more Dmitriy visit that satisfies the SQL clause of 
Materialized View except pizzeria that we can see in a result from exercise #06.
After adding a new visit please refresh a state of data for mv_dmitriy_visits_and_eats.
*/

WITH pv AS (SELECT MAX(id) + 1 AS id FROM person_visits), -- текущий id
     p AS (SELECT person_id FROM (SELECT * FROM person_visits WHERE visit_date = '2022-01-08') AS pr
         JOIN (SELECT * FROM person WHERE name = 'Dmitriy') AS pre ON pre.id = pr.person_id
         ),  -- id Дмитрия
    pizz AS (SELECT m.pizzeria_id
FROM (SELECT * FROM pizzeria WHERE name !=
                                   (SELECT pizzeria_name FROM mv_dmitriy_visits_and_eats)) AS piz
JOIN (SELECT * FROM menu WHERE menu.price < 800) AS m on piz.id = m.pizzeria_id LIMIT 1) -- id пиццерии


INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)

SELECT *, '2022-01-08'::date AS visit_date FROM pv, p, pizz;
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

