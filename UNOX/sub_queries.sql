--movies that have the highest rating
SELECT title, rating
FROM movie
WHERE rating = (
    SELECT MAX(rating) FROM movie
);

--users who have never booked any ticket
SELECT name 
FROM users 
WHERE user_id NOT IN (
    SELECT DISTINCT user_id 
    FROM booking
);

--movie title with the most reviews
SELECT title
FROM movie
WHERE movie_id = (
    SELECT TOP 1 movie_id
    FROM Review
    GROUP BY movie_id
    ORDER BY COUNT(*) DESC
);

--movie has rating > average rating
SELECT show_id, show_datetime, movie_id
FROM show
WHERE movie_id IN (
    SELECT movie_id 
    FROM movie 
    WHERE rating > (
        SELECT AVG(rating) FROM movie
    )
);

--name of users who booked seats starting with 'A'
SELECT DISTINCT u.name
FROM users u
JOIN booking b ON u.user_id = b.user_id
JOIN ticket t ON b.booking_id = t.booking_id
JOIN showseat ss ON t.show_seat_id = ss.show_seat_id
JOIN seat s ON ss.seat_id = s.seat_id
WHERE s.seat_number LIKE 'A%';

--latest show for each movie
SELECT s.show_id, s.movie_id, m.title, s.show_datetime
FROM show s
JOIN movie m ON s.movie_id = m.movie_id
WHERE s.show_datetime = (
    SELECT MAX(s2.show_datetime)
    FROM show s2
    WHERE s2.movie_id = s.movie_id
);

--Users whose booking amount is more than average total cost
SELECT u.name
FROM users u
JOIN booking b ON u.user_id = b.user_id
WHERE b.total_cost > (
    SELECT avg(total_cost) FROM booking
);

--Movies that have no cast assigned
SELECT title
FROM movie
WHERE movie_id NOT IN (
    SELECT DISTINCT movie_id FROM movieCast
);

--List movies with no reviews yet
SELECT title 
FROM movie 
WHERE movie_id NOT IN (
    SELECT DISTINCT movie_id FROM Review
);

--Get users who booked shows only for 'Now Showing' movies
SELECT name 
FROM users 
WHERE user_id IN (
    SELECT user_id 
    FROM booking b
    JOIN show s ON b.show_id = s.show_id
    WHERE s.movie_id IN (
        SELECT movie_id FROM movie WHERE status = 'Now Showing'
    )
)
AND user_id NOT IN (
    SELECT user_id 
    FROM booking b
    JOIN show s ON b.show_id = s.show_id
    WHERE s.movie_id IN (
    SELECT movie_id FROM movie WHERE status != 'Now Showing'
    )
);

--List movie titles reviewed by ‘Mike’
SELECT title
FROM movie
WHERE movie_id IN (
    SELECT movie_id
    FROM review
    WHERE reviewer_name = 'Mike'
);


--Get all seat numbers that are not available (booked) for a specific show
SELECT seat_number
FROM seat
WHERE seat_id IN (
    SELECT seat_id
    FROM showseat
    WHERE show_id = 2 AND is_available = 0
);

--Display all users who downloaded their ticket
SELECT name
FROM users
WHERE user_id IN (
    SELECT b.user_id
    FROM booking b
    JOIN ticket t ON b.booking_id = t.booking_id
    WHERE t.is_downloaded = 1
);

--Get all bookings that have not been ticketed
SELECT *
FROM booking
WHERE booking_id NOT IN (
    SELECT booking_id FROM ticket
);

--Find the name and email of users who have booked for “Interstellar”
SELECT name, email
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM booking
    WHERE show_id IN (
        SELECT show_id
        FROM show
        WHERE movie_id IN (
            SELECT movie_id FROM movie WHERE LOWER(title) = 'interstellar'
        )
    )
);

SELECT title
FROM movie
WHERE movie_id IN (
    SELECT movie_id
    FROM Review
    WHERE content LIKE '%amazing%'
);

--Get names of users who have booked tickets but have not scanned them
SELECT name
FROM users
WHERE user_id IN (
    SELECT user_id
    FROM booking
    WHERE booking_id IN (
        SELECT booking_id
        FROM ticket
        WHERE scanned_at IS NULL
    )
);

--Find the most booked movie
SELECT title
FROM movie
WHERE movie_id = (
    SELECT TOP 1 s.movie_id
    FROM booking b
    JOIN show s ON b.show_id = s.show_id
    GROUP BY s.movie_id
    ORDER BY COUNT(*) DESC
);

--Get the number of shows scheduled for each movie
SELECT title,
    (SELECT COUNT(*) FROM show s WHERE s.movie_id = m.movie_id) AS show_count
FROM movie m;
