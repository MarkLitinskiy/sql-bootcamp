CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date (pperson varchar default 'Dmitriy',
                                                    pprice numeric default 500,
                                                    pdate date default '2022-01-08')
                                                    RETURNS SETOF varchar AS $$
BEGIN
RETURN QUERY SELECT piz.name AS nam
FROM pizzeria AS piz
JOIN (SELECT * FROM menu WHERE price < pprice) AS m ON piz.id = m.pizzeria_id
JOIN (SELECT * FROM person_visits WHERE visit_date = pdate) AS pv ON piz.id = pv.pizzeria_id
JOIN (SELECT * FROM person WHERE name = pperson) AS p ON p.id = pv.person_id;
END;
$$ LANGUAGE plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
