/*
Actually, we have to make improvements to data consistency from one side and performance tuning from the other side. Please create a multicolumn unique index (with name `idx_person_discounts_unique`) that prevents duplicates of pair values person and pizzeria identifiers.

After creation of a new index, please provide any simple SQL statement that shows proof of index usage (by using `EXPLAIN ANALYZE`).
The example of “proof” is below
    
    ...
    Index Scan using idx_person_discounts_unique on person_discounts
    ...
*/

SET enable_seqscan = OFF;
CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);

EXPLAIN ANALYZE SELECT person.name,
       menu.pizza_name,
       menu.price,
       menu.price - (menu.price * person_discounts.discount / 100) AS discount_price,
       pizzeria.name
FROM person
JOIN person_order ON person.id = person_order.person_id
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
JOIN person_discounts ON person_discounts.person_id = person.id
ORDER BY 1, 2;