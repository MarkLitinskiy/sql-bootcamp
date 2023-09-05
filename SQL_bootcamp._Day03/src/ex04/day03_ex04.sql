/*
Please find a union of pizzerias that have orders either from women or from men. 
Other words, you should find a set of pizzerias names have been ordered by females only and make "UNION" operation with 
set of pizzerias names have been ordered by males only. Please be aware with word “only” for both genders. 
For any SQL operators with sets don’t save duplicates (UNION, EXCEPT, INTERSECT). 
Please sort a result by the pizzeria name. The data sample is provided below.
*/

WITH
-- таблица пиццерий, которые посещали мужчины
men AS (SELECT piz.name AS pizzeria_name
FROM (SELECT * FROM person WHERE gender = 'male') AS p
JOIN person_order AS po ON po.person_id = p.id
JOIN menu AS m ON m.id = po.menu_id
JOIN (SELECT * FROM pizzeria) AS piz ON m.pizzeria_id = piz.id
ORDER BY pizzeria_name),

-- таблица пиццерий, которые посещали женщины
women AS (SELECT piz.name AS pizzeria_name
FROM (SELECT * FROM person WHERE gender = 'female') AS p
JOIN person_order AS po ON po.person_id = p.id
JOIN menu AS m ON m.id = po.menu_id
JOIN (SELECT * FROM pizzeria) AS piz ON m.pizzeria_id = piz.id
ORDER BY pizzeria_name),

-- таблица пиццерий, которые посещали больше мужчины
pizzerias_men AS (SELECT * FROM men EXCEPT SELECT * FROM women),

-- таблица пиццерий, которые посещали больше жинщины
pizzerias_women AS (SELECT * FROM women EXCEPT SELECT * FROM men)

SELECT * FROM pizzerias_men
UNION
SELECT * FROM pizzerias_women
ORDER BY 1 ASC;