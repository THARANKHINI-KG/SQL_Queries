--select, orderby, offset, fetch, groupby

select * from users;

SELECT title, genre, rating 
FROM movie 
ORDER BY genre ASC;

SELECT title, genre, rating 
FROM movie 
ORDER BY rating DESC;

SELECT * 
FROM users 
ORDER BY user_id 
OFFSET 2 ROWS 
FETCH NEXT 3 ROWS ONLY;

SELECT * 
FROM users 
ORDER BY user_id 
OFFSET 2 ROWS 
FETCH NEXT 5 ROWS ONLY;

SELECT name 
FROM users 
ORDER BY name desc
OFFSET 2 ROWS 
FETCH NEXT 5 ROWS ONLY;

SELECT email 
FROM users 
ORDER BY email 
OFFSET 3 ROWS 
FETCH NEXT 3 ROWS ONLY;

SELECT movie_id, AVG(rating) AS average_rating 
FROM movie 
GROUP BY movie_id;

SELECT movie_id, AVG(rating) 
FROM movie 
GROUP BY movie_id;

SELECT COUNT(*) AS total_movies FROM movie;

SELECT AVG(rating) AS avg_rating FROM movie;

SELECT MAX(total_cost) AS max_booking_cost FROM booking;

SELECT MIN(capacity) AS min_capacity, MAX(capacity) AS max_capacity FROM screen;

SELECT user_id, COUNT(*) AS total_bookings
FROM booking
GROUP BY user_id;

SELECT review_id, review_date,
       YEAR(review_date) AS review_year,
       MONTH(review_date) AS review_month
FROM Review;

SELECT user_id, COUNT(*) AS total_bookings
FROM booking
GROUP BY user_id
HAVING COUNT(*) > 1;

