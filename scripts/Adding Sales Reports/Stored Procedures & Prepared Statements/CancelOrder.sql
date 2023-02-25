DROP PROCEDURE IF EXISTS CancelOrder;

DELIMITER //

CREATE PROCEDURE CancelOrder(IN id INT)
BEGIN
	DELETE FROM Orders WHERE OrderID = id;
	SELECT CONCAT("Order ", id, " is cancelled") AS Confirmation;
END//
DELIMITER ;

CALL CancelOrder(5);