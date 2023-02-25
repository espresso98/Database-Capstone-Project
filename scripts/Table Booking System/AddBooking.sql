DROP PROCEDURE IF EXISTS AddBooking;

DELIMITER //

CREATE PROCEDURE AddBooking(IN booking_id INT, IN booking_date DATE, IN table_number INT, IN customer_id INT)
BEGIN
	INSERT INTO Bookings (BookingID, BookingDate, TableNumber, CustomerID)
		VALUES (booking_id, booking_date, table_number, customer_id);
	SELECT "New booking added" AS Confirmation;
END//

DELIMITER ;

CALL AddBooking(9, 3, 4, "2022-12-30");