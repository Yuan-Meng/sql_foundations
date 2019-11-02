-- 1. Return all unique values of 'country'
SELECT DISTINCT(country)
FROM ksprojects;

-- 2. Count unique values of main_category and category
SELECT COUNT(DISTINCT(main_category)) AS unique_main_category,  
       COUNT(DISTINCT(category)) AS unique_category
FROM ksprojects;
-- Answer: There are 15 unique main categories and 158 unique categories

/* 3. Return unique combinations of main_category and category
sorted A to Z by main_category */
SELECT main_category, category
FROM ksprojects
ORDER BY main_category;

-- 4. Count unique categories in each main_category
SELECT main_category, COUNT(DISTINCT(category)) AS unique_category
FROM ksprojects
GROUP BY main_category;

/* 5. Return the average number of backers per main_category,
rounded to the nearest whole number and sorted from high to low. */
SELECT ROUND(AVG(backers), 0) AS average_number_of_backers
FROM ksprojects
GROUP BY main_category
ORDER BY average_number_of_backers DESC;

/* 6. Count how many campaigns each category were successful 
and calculate the average difference per project 
between dollars pledged and the goal. */
SELECT COUNT(*) AS successful_campaigns, AVG(usd_pledged - goal) AS usd_above_the_goal
FROM ksprojects
WHERE state = 'successful'
GROUP BY category;

/* 7. Count how many projects each main category had zero backers
and the largest goal amount for that category
(also for projects with zero backers) */
SELECT 
    main_category, 
	COUNT(*) AS project_with_zero_backers,
	(SELECT MAX(goal) AS largest_goal FROM ksprojects),
	MAX(goal) AS largest_goal_without_backers
FROM ksprojects
WHERE backers = 0
GROUP BY main_category;

/* 8. Calculate the average USD per backer
and only return results for which the average is < $50, sorted high to low. */
SELECT AVG(usd_pledged/NULLIF(backers, 0)) AS USD_per_backer
FROM ksprojects
HAVING AVG(usd_pledged/NULLIF(backers, 0)) > 50;

-- 9. Count successful projects each main_category with [5, 10] backers
SELECT main_category, COUNT(*)
FROM ksprojects 
WHERE backers BETWEEN 5 AND 10
GROUP BY main_category;

/* 10. Sum up ‘pledged’ for each type of currency 
and sort by ‘pledged’ from high to low. */
SELECT SUM(pledged) AS total_pledged, currency
FROM ksprojects
GROUP BY currency
ORDER BY total_pledged DESC;

/* 11. Excluding Games and Technology records in the main_category;
sum up backers for successful projects by main_category 
where the total was more than 100,000. 
Sort by main_category from A to Z.*/
SELECT main_category, SUM(backers) 
FROM ksprojects
WHERE state = 'successful' 
      AND (main_category != 'Games' AND main_category != 'Technology')
GROUP BY main_category
HAVING SUM(backers) > 100000
ORDER BY main_category;