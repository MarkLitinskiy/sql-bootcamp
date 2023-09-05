/*
Before further steps please write a SQL statement that returns pizzas’ and corresponding pizzeria names. 

Let’s provide proof that your indexes are working for your SQL.
The sample of proof is the output of the EXPLAIN ANALYZE command.
Please take a look at the sample output command.

 -> Index Scan using idx_menu_pizzeria_id on menu m  (...)
*/

/* 'enable_seqscan'
  Включает или отключает использование планировщиком планов последовательного сканирования.
  Полностью исключить последовательное сканирование невозможно, но при выключении этого
  параметра планировщик не будет использовать данный метод, если можно применить другие.
  По умолчанию этот параметр имеет значение on.*/
SET enable_seqscan = OFF;
EXPLAIN ANALYZE SELECT m.pizza_name, piz.name AS pizzeria_name
FROM menu AS m,pizzeria AS piz
WHERE m.pizzeria_id = piz.id;
