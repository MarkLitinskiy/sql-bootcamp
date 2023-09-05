/*
Please find the names of persons who live on the same address. 
Make sure that the result is ordered by 1st person, 2nd person's name and common address. 
The data sample is presented below. Please make sure your column names are corresponding 
column names below.
*/
SELECT t1.name AS person_name1, t2.name AS person_name2, t1.address AS common_address
FROM (SELECT name, address, id FROM person) AS t1
JOIN (SELECT name, address, id FROM person) AS t2 ON t1.id > t2.id
WHERE t1.address = t2.address AND t1.name != t2.name;
