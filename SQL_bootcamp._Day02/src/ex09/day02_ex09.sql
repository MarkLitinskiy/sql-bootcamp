/*
Please find the names of all females who ordered both pepperoni and cheese pizzas 
(at any time and in any pizzerias). Make sure that the result is ordered by person name. 
The sample of data is presented below.
*/
SELECT  p.name AS name
FROM (SELECT id, gender, name FROM person WHERE gender = 'female') AS p
JOIN person_order ON p.id = person_order.person_id
JOIN (SELECT pizza_name, id FROM menu WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'cheese pizza') AS mp ON person_order.menu_id = mp.id
GROUP BY name
HAVING count(name)>1;