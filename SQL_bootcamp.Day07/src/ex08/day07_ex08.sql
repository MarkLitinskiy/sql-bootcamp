/*
We know about personal addresses from our data. 
Let’s imagine, that particular person visits pizzerias in his/her city only. 
Please write a SQL statement that returns address, pizzeria name and amount of persons’ orders. The result should be sorted by address and then by restaurant name. 
Please take a look at the sample of output data below.
*/

SELECT person.address, pizzeria.name, count(pizzeria.name) AS count_of_orders
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY 1, 2
ORDER BY 1, 2;