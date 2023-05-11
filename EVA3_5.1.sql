DELIMITER //
CREATE FUNCTION generar_rfc(apellido_pat VARCHAR(50), apellido_mat VARCHAR(50), nombre VARCHAR(50), fecha_nac DATE) RETURNS VARCHAR(150)
returns int deterministic modifies sql data  
BEGIN
    DECLARE rfc VARCHAR(13);
    SET rfc = CONCAT(LEFT(apellido_pat, 2),
    IFNULL(LEFT(apellido_mat, 1), 'X'),
    LEFT(nombre, 1), DATE_FORMAT(fecha_nac, '%Y%m%d'));
    RETURN rfc;
END//
DELIMITER ;
