--insert values into the tables
INSERT INTO screen (name, class_type, capacity)
VALUES 
('A', 'Gold', 100),
('B', 'Silver', 80),
('C', 'Iron', 120),
('D', 'Gold', 90);

INSERT INTO seat (seat_number, screen_id)
VALUES
('A1', 1),
('A2', 1),
('B1', 2),
('B2', 2);

INSERT INTO movie (title, genre, rating, status, poster_image_url)
VALUES
('thug life', 'action', 6.8, 'Now Showing', NULL),
('Interstellar', 'Sci-Fi', 9.0, 'Upcoming', NULL),
('vikram', 'action', 7.0, 'Now Showing', NULL),
('bahubali', 'Action', 9.0, 'Upcoming', NULL);

INSERT INTO movieCast (person_name, role, movie_id)
VALUES
('Leonardo DiCaprio', 'Lead', 1),
('Matthew McConaughey', 'Lead', 2),
('Kate Winslet', 'Lead', 3),
('Keanu Reeves', 'Lead', 4);

INSERT INTO Review (content, review_date, reviewer_name, movie_id)
VALUES
('Amazing visuals!', GETDATE(), 'John', 1),
('Thought-provoking.', GETDATE(), 'Sara', 2),
('Emotional story.', GETDATE(), 'Mike', 3),
('Classic action!', GETDATE(), 'Anna', 4);

INSERT INTO show (show_datetime, screen_id, movie_id)
VALUES
('2025-06-12 10:00:00', 1, 1),
('2025-06-12 13:00:00', 2, 2),
('2025-06-12 16:00:00', 1, 3),
('2025-06-12 19:00:00', 2, 4);

INSERT INTO users (name, email, phone)
VALUES
('Abc', 'abc@example.com', '1234564590'),
('Boby', 'boby@example.com', '2345677801'),
('Charliechaplin', 'charliechaplin@example.com', '3456129012'),
('Davidbro', 'davidbro@example.com', '45678901784');

INSERT INTO membership (current_points, user_id)
VALUES
(10, 1),
(20, 2),
(15, 3),
(30, 4);

INSERT INTO ticket (qr_code, delivery_method, is_downloaded, scanned_at, booking_id, show_seat_id)
VALUES
('QR001', 'WhatsApp', 1, GETDATE(), 1, 1),
('QR002', 'App', 1, NULL, 2, 2),
('QR003', 'WhatsApp', 0, NULL, 3, 3),
('QR004', 'App', 1, GETDATE(), 4, 4);
