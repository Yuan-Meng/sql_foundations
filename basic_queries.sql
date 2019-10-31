-- 1. count all records in the vehicles table
SELECT COUNT(*)
FROM vehicles
-- Answer: 33442

-- 2. Return all records in the vehicles table
SELECT * 
FROM vehicles

-- 3. returns id, make, and model for all 2010 vehicles
SELECT id, make, model
FROM vehicles
WHERE year = 2010

-- 4. count vehicles from 2010
SELECT COUNT(*)
FROM vehicles
WHERE year = 2010
-- Answer: 1109

-- 5. count vehicles between the years 2010 and 2015, inclusive
SELECT COUNT(*)
FROM vehicles
WHERE year BETWEEN 2010 AND 2015
-- Answer: 5995

-- 6. count of vehicles from 1990, 2000, and 2010
SELECT COUNT(*)
FROM vehicles
WHERE year = 1990 OR year = 2000 OR year = 2010
-- Answer: 3026

-- 7. count vehicles from 1987 and 2005, exclusive of the years 1990 and 2000
SELECT COUNT(*)
FROM vehicles
WHERE (year BETWEEN 1987 AND 2005) AND (year NOT BETWEEN 1990 AND 2000)
-- Answer: 8745

-- 8. return year, make, model, and average_mpg = (hwy + cty)/2
SELECT year, make, model, (hwy + cty)/2 AS average_mpg
FROM vehicles

-- 9. returns year, make, model, and “X highway; Y city.”
SELECT year, make, model, CONCAT(hwy, ' highway; ', cty, ' city.') AS hwy_city
FROM vehicles

/* 10. id, make, model, and year for all records 
that have NULL for either the cyl or displ field */
SELECT id, make, model, year
FROM vehicles
WHERE cyl IS NULL OR displ IS NULL

/* 11. return all fields for records with rear-wheel drive 
and diesel vehicles since 2000, inclusive. 
Also sort by year and highway mileage, both descending. */
SELECT *
FROM vehicles
WHERE drive = 'Rear-Wheel Drive' AND fuel = 'Diesel' AND year >= 2000
ORDER BY year DESC, hwy DESC

/* 12. vehicles that are either Fords or Chevrolets 
and either compact cars or 2-seaters. */
SELECT COUNT(*) 
FROM vehicles 
WHERE (make = 'Chevrolet' OR make = 'Ford') 
    AND (class ILIKE '%2WD' OR class = 'Compact Cars')
-- Answer: 1675

-- 13. return 10 vehicles with the highest highway fuel mileage
SELECT *
FROM vehicles
ORDER BY hwy DESC
LIMIT 10

/* 14. find all the records of vehicles since the year 2000 
whose model name starts with a capital X. 
Sort the list A through Z by make. */
SELECT *
FROM vehicles
WHERE year >= 2000 AND model LIKE 'X%'
ORDER BY make 
-- Found different records when using a lowercase 'x'

-- 15. count records where the “cyl” field is NULL
SELECT COUNT(*)
FROM vehicles
WHERE cyl IS NULL
-- Answer: 58

/* 16. count of all records before the year 2000 that got more than 20 mpg hwy 
and had greater than 3 liters displacement (“displ” field). 
*/
SELECT COUNT(*)
FROM vehicles
WHERE year < 2000 AND hwy > 20 AND displ > 3
-- Answer: 1964

-- 17. returns all records whose model name has a (capital) X in its 3rd position
SELECT *
FROM vehicles
WHERE model LIKE '___X%'