-- session #1
BEGIN;                                                      --(1)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';            --(3)
UPDATE pizzeria SET rating = 4.0 WHERE name = 'Pizza Hut';  --(5)
COMMIT;                                                     --(7)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';            --(9)

-- session #2
BEGIN;                                                      --(2)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';            --(4)
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';  --(6)
COMMIT;                                                     --(8)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';            --(10)