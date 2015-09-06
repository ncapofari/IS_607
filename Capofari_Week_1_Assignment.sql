/* Nicholas Capofari
   Week 1 Assignmnet  IS607
   9/6/2015 */
   
/* #1 */
SELECT 'Air Planes With Listed Speeds', 
  COUNT(*) FROM planes 
  WHERE planes.speed != '';

/* #2 */  
SELECT 'Total January Distance', 
  SUM(flights.distance) 
  FROM flights
  WHERE flights.month = 1;

SELECT 'Total January Distance WITHOUT Tail Numbers', 
  SUM(flights.distance)
  FROM flights
  WHERE flights.tailnum IS NULL
  AND flights.month = 1;

/* #3 */  
SELECT planes.manufacturer,
  SUM(flights.distance)
  FROM flights
  INNER JOIN planes
  ON planes.tailnum = flights.tailnum
  WHERE flights.day = 5
  AND flights.month = 7
  GROUP BY (planes.manufacturer);
  
SELECT planes.manufacturer,
  SUM(flights.distance)
  FROM flights
  LEFT OUTER JOIN planes
  ON planes.tailnum = flights.tailnum
  WHERE flights.day = 5
  AND flights.month = 7
  GROUP BY (planes.manufacturer);
/* When the LEFT OUTER JOIN was performed, the distance for the 
   planes with NULL as thier manufacturer was also calculated.*/

/* #4 */
/*What is the sum of all miles flown for each carrier on 8/25/2013?*/  
SELECT airlines.name,
  SUM(flights.distance)
  FROM flights
  JOIN planes
      ON planes.tailnum = flights.tailnum
  JOIN airlines
      ON airlines.carrier = flights.carrier
  WHERE flights.day = 25
  AND flights.month = 8
  GROUP BY (airlines.carrier);