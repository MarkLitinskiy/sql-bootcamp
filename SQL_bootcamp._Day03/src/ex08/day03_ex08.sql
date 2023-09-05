/*
Please register a new pizza with name “sicilian pizza” 
(whose id should be calculated by formula is “maximum id value + 1”) with a price of 900 rubles in 
“Dominos” restaurant (please use internal query to get identifier of pizzeria).
*/

WITH m AS (
    SELECT MAX(id) + 1 as id,
    (SELECT id FROM pizzeria WHERE name = 'Dominos') AS pizzeria_id,
    'sicilian pizza' AS pizza_name,
    900 AS price
    FROM menu
)
INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT id, pizzeria_id, pizza_name, price FROM m;
