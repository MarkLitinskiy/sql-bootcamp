/*
Please find the same pizza names who have the same price, but from different pizzerias.
Make sure that the result is ordered by pizza name. The sample of data is presented below. 
Please make sure your column names are corresponding column names below.
*/
SELECT m1.pizza_name AS pizza_name, piz1.name AS pizzeria_name_1, piz2.name AS pizzeria_name_2, m1.price AS price
FROM (SELECT * FROM menu) AS m1
JOIN (SELECT * FROM menu) AS m2 ON m1.price = m2.price AND m1.pizza_name = m2.pizza_name AND (m1.pizzeria_id > m2.pizzeria_id)
JOIN (SELECT * FROM pizzeria) AS piz1 ON m1.pizzeria_id = piz1.id
JOIN (SELECT * FROM pizzeria) AS piz2 ON m2.pizzeria_id = piz2.id
ORDER BY 1 ASC;