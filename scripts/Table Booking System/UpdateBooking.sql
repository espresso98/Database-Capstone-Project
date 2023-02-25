DROP PROCEDURE IF EXISTS UpdateBooking;

DELIMITER //

CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
	UPDATE Bookings SET BookingDate = booking_date WHERE BookingID = booking_id; 
    SELECT CONCAT("Booking ", booking_id, " updated") AS Confirmation;
END//

DELIMITER ;

CALL UpdateBooking(9, "2022-12-17");