--string functions, date functions
SELECT UPPER(name) AS upper_name, LOWER(name) AS lower_name 
FROM users;

SELECT name, LEN(email) AS email_length 
FROM users;

SELECT CONCAT(name, ' - ', email) AS full_detail 
FROM users;

SELECT name, SUBSTRING(email, 1, 5) AS short_email 
FROM users;

SELECT name, email 
FROM users 
WHERE user_id IN (1, 3, 4);

SELECT title, genre 
FROM movie 
WHERE genre IN ('Action', 'Sci-Fi');

SELECT title 
FROM movie 
WHERE status NOT IN ('Upcoming');

SELECT * 
FROM show 
WHERE show_datetime BETWEEN '2025-06-12 10:00:00' AND '2025-06-12 17:00:00';

SELECT * 
FROM users 
WHERE user_id BETWEEN 2 AND 4;

SELECT * 
FROM booking 
WHERE user_id = 2 AND total_cost > 100;

SELECT * 
FROM seat 
WHERE screen_id = 1 AND seat_number LIKE 'A%';

SELECT * 
FROM users 
WHERE name = 'Abc' OR name = 'Davidbro';

SELECT title, rating , genre
FROM movie 
WHERE rating > 8 OR genre = 'Action';

SELECT * FROM booking
WHERE CAST(booking_datetime AS DATE) = CAST(GETDATE() AS DATE);

SELECT * FROM show
WHERE show_datetime BETWEEN GETDATE() AND DATEADD(DAY, 2, GETDATE());

SELECT review_id, DATEDIFF(DAY, review_date, GETDATE()) AS days_ago
FROM Review;

SELECT name, email, LEN(email) AS email_length
FROM users;

SELECT email, CHARINDEX('@', email) AS at_position
FROM users;

SELECT name, LEFT(phone, 3) AS first_digits, RIGHT(phone, 4) AS last_digits
FROM users;

SELECT email, REPLACE(email, 'example.com', 'demo.com') AS updated_email
FROM users;

SELECT name, LTRIM(RTRIM(name)) AS cleaned_name
FROM users;

SELECT name, REVERSE(name) AS reversed_name
FROM users;

SELECT 
  UPPER(name) AS name_upper,
  SUBSTRING(email, 1, 5) + '...' AS short_email,
  CONCAT(name, ' (', phone, ')') AS contact_info
FROM users;
