/*Please modify a SQL statement from “exercise 00” by removing the object_id column. 
Then change ordering by object_name for part of data from the person table and then from 
menu table (like presented on a sample below). Please save duplicates!*/
SELECT name AS object_name FROM person
UNION ALL
SELECT pizza_name FROM menu
ORDER BY object_name;
