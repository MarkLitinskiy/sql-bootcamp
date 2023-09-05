-- session #1
BEGIN;                                                      -- (1)
update pizzeria set rating = 5.0 where name = 'Pizza Hut';  -- (2)
select * from pizzeria where name  = 'Pizza Hut';           -- (3)
COMMIT;                                                     -- (5)

-- session #2
select * from pizzeria where name  = 'Pizza Hut';           -- (4)
select * from pizzeria where name  = 'Pizza Hut';           -- (6)