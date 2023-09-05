/*
Please register new orders 
from Denis and Irina on 24th of February 2022 for the new menu with “sicilian pizza”.
*/

WITH denis AS (
    SELECT MAX(person_order.id) + 1 as id,
    (SELECT id FROM person WHERE name = 'Denis') AS person_id,
    (SELECT id FROM menu WHERE id = 20) AS menu_id,
    '2022-02-24'::date AS order_date
    FROM person_order, menu
),
     irina AS (
    SELECT MAX(person_order.id) + 2 as id,
    (SELECT id FROM person WHERE name = 'Irina') AS person_id,
    (SELECT id FROM menu WHERE id = 20) AS menu_id,
    '2022-02-24'::date AS order_date
    FROM person_order, menu
)

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT id, person_id, menu_id, order_date FROM denis
UNION
SELECT id, person_id, menu_id, order_date FROM irina;