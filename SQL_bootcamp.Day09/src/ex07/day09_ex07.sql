CREATE OR REPLACE FUNCTION func_minimum (VARIADIC arr numeric[]) RETURNS numeric AS $$
BEGIN
CREATE TABLE current (  -- временная таблица с порядковыми номерами элементов массива
    counter numeric
);
INSERT INTO current SELECT * FROM generate_subscripts(arr, 1);  -- Выдаёт ряд значений для
                                                                -- использования в качестве
                                                                -- индекса данного массива
RETURN (SELECT min(arr[counter]) FROM current);
END;
$$ LANGUAGE plpgsql;


SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
drop table IF EXISTS current;  -- удаление временной таблицы

