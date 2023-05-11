DELIMITER //
CREATE PROCEDURE actualizar_clave_rfc()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE id INT;
    DECLARE nombre VARCHAR(255);
    DECLARE apellido_pat VARCHAR(255);
    DECLARE apellido_mat VARCHAR(255);
    DECLARE fecha_nac DATE;
    DECLARE rfc VARCHAR(255);
    DECLARE cur CURSOR FOR SELECT id, nombre, apellido_pat, apellido_mat, fecha_nac FROM personas;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO id, nombre, apellido_pat, apellido_mat, fecha_nac;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SET rfc = generar_rfc(apellido_pat, apellido_mat, nombre, fecha_nac);
        UPDATE personas SET clave_rfc = rfc WHERE id = id;
    END LOOP;
    CLOSE cur;
END//
DELIMITER ;
