create database db;
use db;

--create tables
CREATE TABLE screen (
    screen_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    class_type VARCHAR(10) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE seat (
    seat_id INT IDENTITY(1,1) PRIMARY KEY,
    seat_number VARCHAR(10) NOT NULL,
    screen_id INT NOT NULL,
    FOREIGN KEY (screen_id) REFERENCES screen(screen_id)
);

CREATE TABLE movie (
    movie_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    rating DECIMAL(3,1) NOT NULL,
    status VARCHAR(20) NOT NULL,
    poster_image_url VARCHAR(255) NULL
);

CREATE TABLE movieCast (
    cast_id INT IDENTITY(1,1) PRIMARY KEY,
    person_name VARCHAR(100) NOT NULL,
    role VARCHAR(100) NOT NULL,
    movie_id INT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE Review (
    review_id INT IDENTITY(1,1) PRIMARY KEY,
    content TEXT NOT NULL,
    review_date DATETIME NOT NULL,
    reviewer_name VARCHAR(100) NOT NULL,
    movie_id INT NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE show (
    show_id INT IDENTITY(1,1) PRIMARY KEY,
    show_datetime DATETIME NOT NULL,
    screen_id INT NOT NULL,
    movie_id INT NOT NULL,
    FOREIGN KEY (screen_id) REFERENCES screen(screen_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

CREATE TABLE showseat (
    show_seat_id INT IDENTITY(1,1) PRIMARY KEY,
    is_available BIT NOT NULL DEFAULT 1,
    FOREIGN KEY (show_id) REFERENCES show(show_id),
    FOREIGN KEY (seat_id) REFERENCES seat(seat_id),
    UNIQUE (show_id, seat_id)
);

CREATE TABLE users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone VARCHAR(15) NULL
);

CREATE TABLE membership (
    membership_id INT IDENTITY(1,1) PRIMARY KEY,
    current_points INT NOT NULL DEFAULT 0,
    user_id INT NOT NULL UNIQUE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


CREATE TABLE booking (
    booking_id INT IDENTITY(1,1) PRIMARY KEY,
    booking_datetime DATETIME NOT NULL DEFAULT GETDATE(),
    total_cost DECIMAL(10,2) NOT NULL,
    user_id INT NOT NULL,
    show_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (show_id) REFERENCES show(show_id)
);

CREATE TABLE ticket (
    ticket_id INT IDENTITY(1,1) PRIMARY KEY,
    qr_code VARCHAR(100) NOT NULL,
    delivery_method VARCHAR(50) NOT NULL,
    is_downloaded BIT NOT NULL DEFAULT 0,
    scanned_at DATETIME NULL,
    booking_id INT NOT NULL,
    show_seat_id INT NOT NULL,
    FOREIGN KEY (booking_id) REFERENCES booking(booking_id),
    FOREIGN KEY (show_seat_id) REFERENCES showseat(show_seat_id)
);
