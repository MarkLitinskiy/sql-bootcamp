/*
Don’t use window functions like ROW_NUMBER()
Don’t use atomic INSERT statements |

Please register new orders from all persons for “greek pizza” on 25th of February 2022.
*/

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT generate_series(MAX(person_order.id + 1),MAX(person_order.id) + MAX(person.id)) AS id,
generate_series(1,MAX(person.id)) AS person_id,
(SELECT menu.id FROM menu WHERE pizza_name = 'greek pizza'),
'2022-02-25'::date AS order_date
FROM person_order, person;