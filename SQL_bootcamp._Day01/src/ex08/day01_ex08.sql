/*
 Please rewrite a SQL statement from exercise #07 by using NATURAL JOIN construction. 
 The result must be the same like for exercise #07.
*/
SELECT order_date, concat(name, ' (age:', age, ')') AS name FROM person
NATURAL JOIN (select order_date, person_id as id from person_order) AS current
ORDER BY order_date, name;