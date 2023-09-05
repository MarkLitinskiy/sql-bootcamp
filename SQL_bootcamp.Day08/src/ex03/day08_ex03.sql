-- session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;           --(1)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';            --(3)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';            --(6)
COMMIT;                                                     --(7)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';            --(8)

-- session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;           --(2)
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';  --(4)
COMMIT;                                                     --(5)
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';            --(9)