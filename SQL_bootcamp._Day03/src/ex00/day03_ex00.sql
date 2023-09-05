/*
Please write a SQL statement which returns a list of pizza names, pizza prices, 
pizzerias names and dates of visit for Kate and for prices in range from 800 to 1000 rubles. 
Please sort by pizza, price and pizzeria names. Take a look at the sample of data below.
*/
SELECT m.pizza_name AS pizza_name, m.price AS price, piz.name AS pizzeria_name, pv.visit_date AS visit_date
FROM (SELECT * FROM person WHERE name = 'Kate') AS p
JOIN (SELECT * FROM person_visits) AS pv ON p.id = pv.person_id
JOIN (SELECT * FROM pizzeria) AS piz ON pv.pizzeria_id = piz.id
JOIN (SELECT * FROM menu WHERE price BETWEEN 800 AND 1000) AS m ON piz.id = m.pizzeria_id
ORDER BY pizza_name, price, pizzeria_name ASC;