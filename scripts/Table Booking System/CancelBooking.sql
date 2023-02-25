DROP PROCEDURE IF EXISTS CancelBooking;

DELIMITER //

CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
	DELETE FROM Bookings WHERE BookingID = booking_id; 
    SELECT CONCAT("Booking ", booking_id, " cancelled") AS Confirmation;
END//

DELIMITER ;

CALL CancelBooking(9);