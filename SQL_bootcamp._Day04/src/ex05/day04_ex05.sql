/*
Please create a Database View v_price_with_discount that returns a person's orders 
with person names, pizza names, real price and calculated column discount_price 
(with applied 10% discount and satisfies formula price - price*0.1). 
The result please sort by person name and pizza name and make a round for discount_price 
column to integer type. Please take a look at a sample result below.
*/

CREATE VIEW v_price_with_discount AS
SELECT p.name AS name, m.pizza_name AS pizza_name, m.price AS price, ROUND(m.price - (m.price * 0.1))::int AS discount_price
FROM person AS p
JOIN person_order AS po ON po.person_id = p.id
JOIN menu AS m ON po.menu_id = m.id
ORDER BY name, pizza_name ASC;
