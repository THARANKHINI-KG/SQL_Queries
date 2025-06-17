--other insertion, updation, deletion queries
INSERT INTO users (name, email, phone)
VALUES ('Ravi Kumar', 'ravi@example.com', '9876543210');

UPDATE showseat
SET is_available = 0
WHERE show_id = 1 AND seat_id = 2;

DELETE FROM Review
WHERE review_id = 3;

ALTER TABLE movie
ADD language VARCHAR(50) DEFAULT 'English';

DROP TABLE membership;

INSERT INTO screen (name, class_type, capacity) VALUES
('A', 'Gold', 100),
('B', 'Silver', 80),
('C', 'Iron', 120),
('D', 'Gold', 90);

INSERT INTO seat (seat_number, screen_id) VALUES
('A1', 1),
('A2', 1),
('B1', 2),
('B2', 2),
('C1', 3),
('C2', 3),
('D1', 4),
('D2', 4);

INSERT INTO movie (title, genre, rating, status, poster_image_url, language) VALUES
('Thug Life', 'Action', 6.8, 'Now Showing', NULL, 'Tamil'),
('Interstellar', 'Sci-Fi', 9.0, 'Upcoming', NULL, 'English'),
('Vikram', 'Action', 7.0, 'Now Showing', NULL, 'Tamil'),
('Bahubali', 'Action', 9.0, 'Upcoming', NULL, 'Telugu');

INSERT INTO movieCast (person_name, role, movie_id) VALUES
('Kamal Haasan', 'Lead', 3),
('Suriya', 'Antagonist', 3),
('Matthew McConaughey', 'Lead', 2),
('Prabhas', 'Hero', 4),
('Leonardo DiCaprio', 'Explorer', 2),
('Rajinikanth', 'Cameo', 1);

INSERT INTO Review (content, review_date, reviewer_name, movie_id) VALUES
('Amazing visuals!', GETDATE(), 'John', 1),
('Thought-provoking.', GETDATE(), 'Sara', 2),
('Intense thriller!', GETDATE(), 'Mike', 3),
('Epic story!', GETDATE(), 'Anna', 4),
('Mind-blowing ending!', GETDATE(), 'Ravi', 2);

INSERT INTO show (show_datetime, screen_id, movie_id) VALUES
('2025-06-16 10:00:00', 1, 1),
('2025-06-16 13:00:00', 2, 2),
('2025-06-16 16:00:00', 3, 3),
('2025-06-16 19:00:00', 4, 4);

INSERT INTO showseat (show_id, seat_id, is_available) VALUES
(2, 8, 0);

INSERT INTO users (name, email, phone) VALUES
('Abc', 'abc@example.com', '1234564590'),
('Boby', 'boby@example.com', '2345677801'),
('Charlie', 'charlie@example.com', '3456789012'),
('David', 'david@example.com', '4567890123'),
('Ravi Kumar', 'ravi@example.com', '9876543210');

 INSERT INTO booking (booking_datetime, total_cost, user_id, show_id) VALUES
(GETDATE(), 250.00, 1, 1),
(GETDATE(), 300.00, 2, 2),
(GETDATE(), 220.00, 3, 3),
(GETDATE(), 275.00, 4, 4),
(GETDATE(), 260.00, 5, 3);

CREATE TABLE membership (
    membership_id INT IDENTITY(1,1) PRIMARY KEY,
    current_points INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
INSERT INTO membership (current_points, user_id) VALUES
(100, 1),
(150, 2),
(200, 3),
(180, 4),
(250, 5);

INSERT INTO ticket (qr_code, delivery_method, is_downloaded, scanned_at, booking_id, show_seat_id) VALUES
('QR001', 'WhatsApp', 1, GETDATE(), 1, 1),
('QR002', 'App', 1, NULL, 2, 3),
('QR003', 'Email', 0, NULL, 3, 4),
('QR004', 'App', 1, GETDATE(), 4, 15),
('QR005', 'WhatsApp', 1, NULL, 5, 17);
