DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN booking_date DATE, IN table_number INT, IN customer_id INT)
BEGIN
	DECLARE FoundBooking INT DEFAULT 0;
	START TRANSACTION;
	SELECT COUNT(*) INTO FoundBooking
	FROM Bookings
	WHERE BookingDate = booking_date AND TableNumber = table_number;

	INSERT INTO Bookings (BookingDate, TableNumber, CustomerID)
	VALUES (booking_date, table_number, customer_id);
    
	IF FoundBooking <> 0 THEN
		SELECT CONCAT("Table ", table_number, " is already booked - booking cancelled") AS "Booking status";
		ROLLBACK;
		ELSE
		SELECT CONCAT("Table ", table_number, " is booked for ", customer_id) AS "Booking status";
		COMMIT;
	END IF;
END//

DELIMITER ;

CALL AddValidBooking("2022-12-17", 6, 5);