-- session #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;   --(1)
UPDATE pizzeria SET rating = 1.0 WHERE id = 1;      --(3)
UPDATE pizzeria SET rating = 1.0 WHERE id = 2;      --(5)
COMMIT;                                             --(7)

-- session #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;   --(2)
UPDATE pizzeria SET rating = 1.0 WHERE id = 2;      --(4)
UPDATE pizzeria SET rating = 1.0 WHERE id = 1;      --(6)
COMMIT;                                             --(8)