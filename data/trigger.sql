-- Trigger untuk membuat ID dengan format AB001
DELIMITER //
CREATE TRIGGER before_insert_absen
BEFORE INSERT ON `absen`
FOR EACH ROW
BEGIN
    SET NEW.id = CONCAT('AB', LPAD(NEW.id_auto, 3, '0'));  -- Membuat ID dengan format AB001
END//
DELIMITER ;

a