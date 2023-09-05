/*
Please write a SQL statement which returns a list of pizzerias which Andrey visited but did not make any orders. 
Please order by the pizzeria name. 
The sample of data is provided below.
*/

SELECT piz.name pizzeria_name  -- Пиццерии, которые послетил
FROM (SELECT * FROM person WHERE name = 'Andrey') AS p
JOIN person_visits AS pv ON pv.person_id = p.id
JOIN pizzeria AS piz ON pv.pizzeria_id = piz.id
EXCEPT
SELECT piz.name pizzeria_name  -- Пиццерии, в которых делал заказ
FROM  (SELECT * FROM person WHERE name = 'Andrey') AS p
JOIN (SELECT * FROM person_order) AS po ON po.person_id = p.id
JOIN menu AS m ON po.menu_id = m.id
JOIN pizzeria AS piz ON m.pizzeria_id = piz.id
ORDER BY 1 ASC;