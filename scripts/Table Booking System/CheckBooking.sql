DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER //

CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
	DECLARE FoundBooking INT DEFAULT 0;
	SELECT COUNT(FoundBooking) INTO FoundBooking
	FROM Bookings
	WHERE BookingDate = booking_date and TableNumber = table_number;
    
    IF FoundBooking <> 0 THEN
		SELECT CONCAT("Table ", table_number, " is already booked") AS BookingStatus
		ELSE 
        SELECT CONCAT("Table ", table_number, " is available to book") AS BookingStatus
	END IF
END//

DELIMITER ;

CALL CheckBooking("2022-12-30", 5);