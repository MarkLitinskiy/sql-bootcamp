/*
Please find pizzerias that have been visited more often by women or by men. 
For any SQL operators with sets save duplicates (UNION ALL, EXCEPT ALL, INTERSECT ALL constructions). 
Please sort a result by the pizzeria name. The data sample is provided below.
*/

WITH
-- таблица пиццерий, которые посещали мужчины
men AS (SELECT piz.name AS pizzeria_name
FROM (SELECT * FROM person WHERE gender = 'male') AS p
JOIN person_visits AS pv ON pv.person_id = p.id
JOIN (SELECT * FROM pizzeria) AS piz ON pv.pizzeria_id = piz.id
ORDER BY pizzeria_name),

-- таблица пиццерий, которые посещали женщины
women AS (SELECT piz.name AS pizzeria_name
FROM (SELECT * FROM person WHERE gender = 'female') AS p
JOIN person_visits AS pv ON pv.person_id = p.id
JOIN (SELECT * FROM pizzeria) AS piz ON pv.pizzeria_id = piz.id
ORDER BY pizzeria_name),

-- таблица пиццерий, которые посещали больше мужчины
pizzerias_men AS (SELECT * FROM men EXCEPT ALL SELECT * FROM women),

-- таблица пиццерий, которые посещали больше жинщины
pizzerias_women AS (SELECT * FROM women EXCEPT ALL SELECT * FROM men)

SELECT * FROM pizzerias_men
UNION ALL
SELECT * FROM pizzerias_women
ORDER BY 1 ASC;
