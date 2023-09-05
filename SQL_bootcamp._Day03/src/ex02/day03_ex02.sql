/*
Please use SQL statement from Exercise #01 and show pizza names from pizzeria which are not ordered by anyone, 
including corresponding prices also. The result should be sorted by pizza name and price. 
The sample of output data is presented below.
*/
SELECT menu.pizza_name AS pizza_name, menu.price AS price, piz.name AS pizzeria_name
FROM menu
JOIN (SELECT * FROM pizzeria) AS piz ON piz.id = menu.pizzeria_id
WHERE menu.id NOT IN (SELECT menu_id FROM person_order)
ORDER BY 1, 2;