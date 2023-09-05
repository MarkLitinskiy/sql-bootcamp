CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS trigger AS $trg_person_audit$
    BEGIN
    IF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit SELECT now(), 'D',
                                            OLD.id,
                                            OLD.name, OLD.age, OLD.gender, OLD.address;
    ELSIF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit SELECT now(), 'U',
                                            OLD.id,
                                            OLD.name, OLD.age, OLD.gender, OLD.address;
    ELSIF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit SELECT now(), 'I',
                                            NEW.id,
                                            NEW.name, NEW.age, NEW.gender, NEW.address;
    END IF;
    RETURN NULL; -- возвращаемое значение для триггера AFTER игнорируется
    END;
$trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_audit
AFTER DELETE OR UPDATE OR INSERT ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();

drop trigger if exists trg_person_delete_audit on person;
drop trigger if exists trg_person_insert_audit on person;
drop trigger if exists trg_person_update_audit on person;

drop function if exists fnc_trg_person_delete_audit();
drop function if exists fnc_trg_person_insert_audit();
drop function if exists fnc_trg_person_update_audit();

TRUNCATE person_audit;

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;