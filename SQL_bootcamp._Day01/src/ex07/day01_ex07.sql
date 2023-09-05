/*
 Please write a SQL statement which returns the date of order from the person_order table
 and corresponding person name (name and age are formatted as in the data sample below) 
 which made an order from the person table. Add a sort by both columns in ascending mode.
*/
SELECT order_date, (SELECT concat(name, ' (age:', age, ')') FROM person WHERE person_order.person_id = person.id) AS name
FROM person_order
ORDER BY order_date, name;
