/*
Please write a SQL statement that returns a whole list of person names visited 
(or not visited) pizzerias during the period from 1st to 3rd of January 2022 from one 
side and the whole list of pizzeria names which have been visited (or not visited) from 
the other side. The data sample with needed column names is presented below. 
Please pay attention to the substitution value ‘-’ for NULL values in person_name and 
pizzeria_name columns. Please also add ordering for all 3 columns.
*/
SELECT COALESCE(person.name,'-') AS person_name, pers.visit_date AS visit_date, COALESCE(pizza.name,'-') AS pizzeria_name
FROM person
FULL JOIN (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS pers ON pers.person_id = person.id
FULL JOIN (SELECT * FROM pizzeria) AS pizza ON pers.pizzeria_id = pizza.id
ORDER BY 1, 2, 3;
