/*
Please register new visits into Dominos restaurant from Denis and Irina on 24th of February 2022.
*/

WITH denis AS (
    SELECT MAX(person_visits.id) + 1 as id,
    (SELECT id FROM person WHERE name = 'Denis') AS person_id,
    (SELECT id FROM pizzeria WHERE name = 'Dominos') AS pizzeria_id,
    '2022-02-24'::date AS visit_date
    FROM person_visits, menu
),
    irina AS (
    SELECT MAX(person_visits.id) + 2 as id,
    (SELECT id FROM person WHERE name = 'Irina') AS person_id,
    (SELECT id FROM pizzeria WHERE name = 'Dominos') AS pizzeria_id,
    '2022-02-24'::date AS visit_date
    FROM person_visits, menu
)

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT id, person_id, pizzeria_id, visit_date FROM denis
UNION
SELECT id, person_id, pizzeria_id, visit_date FROM irina;