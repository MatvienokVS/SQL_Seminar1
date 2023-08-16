DELIMITER //
CREATE PROCEDURE DeleteUserProcedure(IN userId INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;
    CALL DeleteUser(userId);
    COMMIT;
END;
//
DELIMITER ;