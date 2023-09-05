CREATE OR REPLACE FUNCTION fnc_fibonacci (pstop integer default 10) RETURNS SETOF integer AS $$
BEGIN
RETURN QUERY WITH RECURSIVE Q(Num,Prev) AS(
   SELECT 0, 1
  UNION ALL
   SELECT Q.Num + Q.Prev, Q.Num
     FROM Q
    WHERE Q.Num + Q.Prev < pstop
)
SELECT Num FROM Q;
END;

$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();