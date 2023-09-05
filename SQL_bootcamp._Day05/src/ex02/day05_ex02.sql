/*
Please create a functional B-Tree index with name idx_person_name for the column name of the person table. 
Index should contain person names in upper case.

Please write and provide any SQL with proof (EXPLAIN ANALYZE) that index idx_person_name is working.
*/

SET enable_seqscan = OFF;

CREATE INDEX IF NOT EXISTS idx_person_name ON person (UPPER(name));

EXPLAIN ANALYZE SELECT UPPER(person.name) FROM person WHERE UPPER(person.name) = UPPER('Dmitriy');