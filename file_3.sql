--commit
BEGIN TRANSACTION;

UPDATE showseat
SET is_available = 0
WHERE show_id = 2 AND seat_id = 8;

INSERT INTO booking (booking_datetime, total_cost, user_id, show_id)
VALUES (GETDATE(), 300.00, 2, 2);

COMMIT;


--rollback
BEGIN TRANSACTION;

UPDATE membership
SET current_points = current_points - 500
WHERE user_id = 2;

ROLLBACK TRANSACTION;


--savepoint
BEGIN TRANSACTION;

UPDATE membership
SET current_points = current_points - 50
WHERE user_id = 2;

SAVE TRANSACTION deduct_points;

INSERT INTO ticket (qr_code, delivery_method, is_downloaded, scanned_at, booking_id, show_seat_id)
VALUES ('QR999', 'App', 1, GETDATE(), 2, 4);

ROLLBACK TRANSACTION deduct_points;

COMMIT;