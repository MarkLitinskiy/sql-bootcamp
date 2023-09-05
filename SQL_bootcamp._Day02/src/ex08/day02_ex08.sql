/*
Please find the names of all males from Moscow or Samara cities who orders either 
pepperoni or mushroom pizzas (or both) . Please order the result by person name in 
descending mode. The sample of output is presented below.
*/
SELECT DISTINCT p.name AS name
FROM (SELECT * FROM person WHERE address = 'Moscow' OR address = 'Samara') AS p
JOIN person_order ON person_order.person_id = p.id
JOIN (SELECT * FROM menu WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza') AS m ON m.id = person_order.person_id
ORDER BY 1 DESC;