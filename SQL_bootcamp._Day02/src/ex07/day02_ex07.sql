/*
Please find the name of pizzeria Dmitriy visited on January 8, 2022 and could eat pizza 
for less than 800 rubles.
*/
SELECT pizzeria.name AS pizzeria_name
FROM (SELECT * FROM person WHERE name = 'Dmitriy') AS p
JOIN (SELECT * FROM person_visits WHERE visit_date = '2022-01-08') AS pv ON p.id = pv.person_id
JOIN pizzeria ON pv.pizzeria_id = pizzeria.id
JOIN (SELECT * FROM menu WHERE menu.price < 800) AS m ON m.pizzeria_id = pizzeria.id;