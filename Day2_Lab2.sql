USE sakila;

#In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. 
#These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
SELECT last_name, count(*) repeats
FROM sakila.actor
GROUP by 1
HAVING repeats = 1;


#Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT last_name, count(*) repeats
FROM sakila.actor
GROUP BY 1
HAVING repeats > 1
ORDER BY 2 DESC;


#Using the rental table, find out how many rentals were processed by each employee.
SELECT staff_id, count(*)
FROM sakila.rental
GROUP BY staff_id;

#Using the film table, find out how many films were released each year.
SELECT release_year, count(*) 
FROM sakila.film
GROUP BY release_year;


#Using the film table, find out for each rating how many films were there.
SELECT rating, count(*)
FROM sakila.film
GROUP BY rating;

#What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT rating, round(AVG(length), 2) AS mean_length
FROM sakila.film
GROUP BY rating;


#Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, round(AVG(length), 2) AS mean_length
FROM sakila.film
GROUP BY rating
HAVING mean_length > 120;


#Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
#MY INTERPRETATION OF THIS QUESTION BECAUSE ITS HARD TO UNDERSTAND THE MEANING OF A NEW COLUMN CALLED 'THE RANK'?

SELECT title, length, 
CASE
WHEN length BETWEEN 46 AND 115.2720 THEN 'Below Avereage Length'
ELSE 'Above average length'
END AS ranks
FROM sakila.film
