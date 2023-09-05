-- session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;           --(1)
SELECT SUM(rating) FROM pizzeria;                           --(3)
SELECT SUM(rating) FROM pizzeria;                           --(6)
COMMIT;                                                     --(7)
SELECT SUM(rating) FROM pizzeria;                           --(8)

-- session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;           --(2)
UPDATE pizzeria SET rating = 1.0 WHERE name = 'Pizza Hut';  --(4)
COMMIT;                                                     --(5)
SELECT SUM(rating) FROM pizzeria;                           --(9)