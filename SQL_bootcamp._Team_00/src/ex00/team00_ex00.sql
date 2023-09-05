/*
Please take a look at the Graph on the left. 
There are 4 cities (a, b, c and d) and arcs between them with cost (or taxination). Actually the cost (a,b) = (b,a).

Please create a table with name nodes by using structure {point1, point2, cost} and fill data based on a picture (remember there are direct and reverse paths between 2 nodes).
Please write one SQL statement that returns all tours (aka paths) with minimal traveling cost if we will start from city "a".
Just remember, you need to find the cheapest way of visiting all the cities and returning to your starting point. For example, the tour looks like that a -> b -> c -> d -> a.

The sample of output data you can find below. Please sort data by total_cost and then by tour.
*/

CREATE TABLE price (
  id SERIAL PRIMARY KEY,
  point1 CHARACTER VARYING(1),
  point2 CHARACTER VARYING(1),
  cost INTEGER
);
INSERT INTO price (id, point1, point2, cost)
VALUES (1, 'a', 'b', 10),
  (2, 'b', 'a', 10),
  (3, 'a', 'd', 20),
  (4, 'd', 'a', 20),
  (5, 'a', 'c', 15),
  (6, 'c', 'a', 15),
  (7, 'b', 'd', 25),
  (8, 'd', 'b', 25),
  (9, 'c', 'd', 30),
  (10, 'd', 'c', 30),
  (11, 'b', 'c', 35),
  (12, 'c', 'b', 35);
WITH RECURSIVE nodes AS (
  SELECT CONCAT('{', point1) AS tour,
    point1,
    point2,
    cost
  FROM price
  WHERE point1 = 'a'
  UNION
  SELECT CONCAT(nodes.tour, ',', price.point1) AS tour,
    price.point1,
    price.point2,
    nodes.cost + price.cost
  FROM nodes
    JOIN price ON nodes.point2 = price.point1
  WHERE tour NOT LIKE CONCAT('%', price.point1, '%')
)
SELECT cost AS total_cost,
  CONCAT(tour, ',', point2, '}') as tour
FROM nodes
WHERE point2 = 'a'
  AND LENGTH(tour) = (
    SELECT MAX(LENGTH(tour))
    FROM nodes
  )
  AND cost = (
    SELECT MIN(cost)
    FROM nodes
    WHERE point2 = 'a'
      AND LENGTH(tour) = (
        SELECT MAX(LENGTH(tour))
        FROM nodes
      )
  )
  ORDER BY 1,2;
