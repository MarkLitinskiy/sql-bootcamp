/*
Please write a SQL statement that returns the amount of orders, average of price, maximum and minimum prices for sold pizza by corresponding pizzeria restaurant. The result should be sorted by pizzeria name. Please take a look at the data sample below. 
Round your average price to 2 floating numbers.
*/

SELECT piz.name AS name, count(name) AS count_of_orders,
        ROUND(AVG(price), 2) AS average_price,
        MAX(price) AS max,
        MIN(price) AS min
FROM pizzeria AS piz
JOIN menu ON menu.pizzeria_id = piz.id
JOIN person_order ON person_order.menu_id = menu.id
GROUP BY name, pizzeria_id
ORDER BY name;

