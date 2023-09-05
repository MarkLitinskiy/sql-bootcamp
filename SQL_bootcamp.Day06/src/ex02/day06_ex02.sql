/*
Please write a SQL statement that returns orders with actual price and price with applied discount for each person in the corresponding pizzeria restaurant and sort by person name, and pizza name. 
Please take a look at the sample of data below.
*/

SELECT DISTINCT person.name,
       menu.pizza_name,
       menu.price,
       menu.price - (menu.price * person_discounts.discount / 100) AS discount_price,
       pizzeria.name
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_discounts ON person_discounts.person_id = person.id AND pizzeria.id = person_discounts.pizzeria_id
ORDER BY 1, 2;