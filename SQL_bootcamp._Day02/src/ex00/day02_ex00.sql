/*
Please write a SQL statement which returns a list of pizzerias names with corresponding 
rating value which have not been visited by persons.
*/
SELECT pizzeria.name AS pizzeria_name, pizzeria.rating AS rating
FROM pizzeria LEFT JOIN person_visits
ON pizzeria.id = person_visits.pizzeria_id
where pizzeria_id is null;