--joins

SELECT u.name, b.booking_datetime 
FROM users u
INNER JOIN booking b ON u.user_id = b.user_id;

SELECT u.name, b.booking_datetime 
FROM users u
LEFT JOIN booking b ON u.user_id = b.user_id;

SELECT u.name, b.booking_id, b.booking_datetime
FROM users u
JOIN booking b ON u.user_id = b.user_id;

SELECT b.booking_id, m.title, s.show_datetime
FROM booking b
JOIN show s ON b.show_id = s.show_id
JOIN movie m ON s.movie_id = m.movie_id;

SELECT sh.show_id, shs.seat_id, se.seat_number, shs.is_available
FROM showseat shs
JOIN seat se ON shs.seat_id = se.seat_id
JOIN show sh ON sh.show_id = shs.show_id;

SELECT m.title, COUNT(r.review_id) AS review_count
FROM movie m
LEFT JOIN Review r ON m.movie_id = r.movie_id
GROUP BY m.title;

SELECT t.ticket_id, u.name, t.qr_code, t.delivery_method
FROM ticket t
JOIN booking b ON t.booking_id = b.booking_id
JOIN users u ON b.user_id = u.user_id;

SELECT u.name, b.show_id
FROM users u
INNER JOIN booking b ON u.user_id = b.user_id;

SELECT u.name, b.show_id
FROM users u
LEFT JOIN booking b ON u.user_id = b.user_id;

SELECT u.name, b.show_id
FROM users u
RIGHT JOIN booking b ON u.user_id = b.user_id;

SELECT u.name, b.show_id
FROM users u
FULL OUTER JOIN booking b ON u.user_id = b.user_id;

SELECT u.name, b.show_id
FROM users u
CROSS JOIN booking b;

SELECT u.name, COUNT(b.booking_id) AS total_bookings
FROM users u
JOIN booking b ON u.user_id = b.user_id
WHERE b.booking_datetime > '2024-06-01'
GROUP BY u.name
ORDER BY total_bookings DESC;

SELECT m.title, COUNT(b.booking_id) AS total_bookings
FROM booking b
JOIN show s ON b.show_id = s.show_id
JOIN movie m ON s.movie_id = m.movie_id
GROUP BY m.title
ORDER BY total_bookings DESC;

SELECT DISTINCT u.name
FROM users u
JOIN booking b ON u.user_id = b.user_id
WHERE b.booking_datetime > '2024-06-01'
ORDER BY u.name;

SELECT u.name, COUNT(b.booking_id) AS bookings
FROM users u
JOIN booking b ON u.user_id = b.user_id
GROUP BY u.name
HAVING COUNT(b.booking_id) > 1
ORDER BY bookings DESC;

SELECT m.title, COUNT(s.show_id) AS show_count
FROM movie m
JOIN show s ON m.movie_id = s.movie_id
GROUP BY m.title
ORDER BY show_count DESC;

SELECT sc.name AS screen_name, COUNT(b.booking_id) AS bookings
FROM screen sc
JOIN show s ON sc.screen_id = s.screen_id
JOIN booking b ON s.show_id = b.show_id
GROUP BY sc.name
ORDER BY bookings DESC;

SELECT CAST(b.booking_datetime AS DATE) AS booking_date, COUNT(*) AS total_bookings
FROM booking b
GROUP BY CAST(b.booking_datetime AS DATE)
ORDER BY booking_date;

SELECT m.title, COUNT(DISTINCT b.user_id) AS unique_users
FROM movie m
JOIN show s ON m.movie_id = s.movie_id
JOIN booking b ON s.show_id = b.show_id
GROUP BY m.title
ORDER BY unique_users DESC;

SELECT sc.class_type, COUNT(b.booking_id) AS total_bookings
FROM booking b
JOIN show s ON b.show_id = s.show_id
JOIN screen sc ON s.screen_id = sc.screen_id
GROUP BY sc.class_type
ORDER BY total_bookings DESC;

SELECT TOP 1 u.name, COUNT(*) AS total_bookings
FROM users u
JOIN booking b ON u.user_id = b.user_id
GROUP BY u.name
ORDER BY total_bookings DESC;

--cartesian join
select * from users,booking;
