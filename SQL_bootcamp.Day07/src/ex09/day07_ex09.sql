/*
Please write a SQL statement that returns aggregated information by person’s address , the result of “Maximal Age - (Minimal Age  / Maximal Age)” that is presented as a formula column, 
next one is average age per address and the result of comparison between formula and average columns (other words, 
if formula is greater than  average then True, otherwise False value).

The result should be sorted by address column.
*/

WITH stat AS (SELECT DISTINCT p.address AS address,
       round((SELECT CAST(MAX(age) AS numeric) FROM person WHERE person.address = p.address) -
       ((SELECT CAST(MIN(age) AS numeric) FROM person WHERE person.address = p.address) /
        (SELECT CAST(MAX(age) AS numeric) FROM person WHERE person.address = p.address)), 2) AS formule,
       ROUND((SELECT AVG(age) FROM person WHERE person.address = p.address), 2) AS average
        FROM person AS p)
SELECT *,
CASE
    WHEN stat.formule > stat.average
        THEN 'true'
    ELSE 'false'
    END AS comparison
FROM stat
ORDER BY 1;

