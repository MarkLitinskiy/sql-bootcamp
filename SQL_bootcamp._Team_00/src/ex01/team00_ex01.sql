/*
Please add a possibility to see additional rows with the most expensive cost to the SQL from previous exercise. 
Just take a look at the sample of data below. Please sort data by total_cost and then by tour.
*/

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
ORDER BY 1,
  2;
