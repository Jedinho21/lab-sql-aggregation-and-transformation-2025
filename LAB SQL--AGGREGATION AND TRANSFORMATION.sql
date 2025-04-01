--- 1.Determine the shortest and longest movie durations and name the values as max_duration and min_duration.

SELECT 
      MAX(LENGTH) AS MAX_DURATION,
      MIN(LENGTH) AS MIN_DURATION
FROM FILM;

--- 2. Express the average movie duration in hours and minutes Dont use decimals.  Hint: Look for floor and round functions.

SELECT 
    FLOOR(AVG(LENGTH) / 60) AS hours,  -- Calculate hours
    ROUND(AVG(LENGTH) % 60) AS minutes -- Calculate remaining minutes
FROM 
    FILM;
    
--- 3.Calculate the number of days that the company has been operating.
    
SELECT DATEDIFF(MAX(rental_date),
       MIN(rental_date)) AS operating_days
FROM rental;

--- 4. Retrieve rental information and add two additional columns to show the month and weekday of the rental. 
--- Return 20 rows of results.

SELECT *,
monthname(RENTAL_DATE)AS RENTAL_MONTH,
dayname(RENTAL_DATE) AS RENTAL_DAY 
FROM RENTAL
LIMIT 20;

--- 5. Bonus: Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday',
 --- depending on the day of the week.
 
 SELECT*,
 CASE
     WHEN DAYNAME(RENTAL_DATE) IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday') THEN 'It is a weekday'
 ELSE 'It is a weekend'
 END AS DAY_TYPE
 FROM RENTAL;
 
 --- 6.You need to ensure that customers can easily access information about the movie collection. To achieve this, retrieve the film titles and 
 --- their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. 
 --- Sort the results of the film title in ascending order.
    
select title, coalesce(rental_duration,'Not available') as Rental_duration
from film
order by title asc;

--- 7.

select concat(first_name,' ',last_name) as Full_name,
       substring(email,1,3) as Email_prefix
from customer
order by last_name asc;


--- 8 The total number of films that have been released.
SELECT COUNT(TITLE) AS TOTAL_FILMS 
FROM FILM;

--- 9. The number of films for each rating.

SELECT RATING, COUNT(RATING) AS FILM_COUNT
FROM FILM
GROUP BY RATING;

--- 10. The number of films for each rating, sorting the results in descending order of the number of films.

SELECT RATING, COUNT(RATING) AS FILM_COUNT
FROM FILM
GROUP BY RATING
ORDER BY FILM_COUNT DESC;

---  11. The mean film duration for each rating, and sort the results in descending order of the mean duration. 
--- Round off the average lengths to two decimal places. This will help identify popular movie lengths for each category.
    
    SELECT *FROM FILM;
    
    SELECT RATING, ROUND(AVG(LENGTH),2) AS MEAN_FILM_DURATION
    FROM FILM
    GROUP BY RATING
    ORDER BY RATING DESC;
    
    --- 12.  Identify which ratings have a mean duration of over two hours in order to help select films 
    --- for customers who prefer longer movies
    
    SELECT RATING,ROUND(AVG(LENGTH),2) AS MEAN_FILM_DURATION
	FROM FILM
    GROUP BY RATING
    HAVING MEAN_FILM_DURATION>120;
    
    --- 13.  determine which last names are not repeated in the table actor.
    
SELECT last_name
FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;
    
    
    
    