/*
Please find all pizza names (and corresponding pizzeria names using menu table) 
that Denis or Anna ordered. Sort a result by both columns. The sample of output is 
presented below.
*/
SELECT menu.pizza_name AS pizza_name, pizzeria.name AS pizzeria_name
FROM (SELECT * FROM person WHERE name = 'Denis' OR name = 'Anna') AS pers
JOIN person_order ON pers.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2;