DELIMITER //
CREATE PROCEDURE agregar_nueva_reserva (
    IN r_id_cliente INT,
    IN r_cantidad_personas INT,
    IN r_check_in_date DATETIME,
    IN r_check_out_date DATETIME,
    IN r_tipo_de_pago VARCHAR(15),
    IN r_habitacion_id INT,
    IN r_fecha_reserva DATETIME,
    IN r_estado VARCHAR(15))
BEGIN 
    INSERT INTO Reserva (id_cliente, cantidad_personas, check_in_date, check_out_date, tipo_de_pago, habitacion_id, fecha_reserva, estado)
    VALUES (r_id_cliente, r_cantidad_personas, r_check_in_date, r_check_out_date, r_tipo_de_pago, r_habitacion_id, r_fecha_reserva, r_estado);
END// 

DELIMITER ;
CALL agregar_nueva_reserva (3, 3, '2024-08-27 07:00:00','2024-08-29 12:00:00', 'Tarjeta', 1, '2024-07-06 17:00:00', 'pendiente');

DROP PROCEDURE agregar_nueva_reserva

#Creacion stored procedure que cancela las reservas.
DELIMITER//

CREATE PROCEDURE `cancelar_reserva`(cancelar_id_reserva INT,estado_reserva VARCHAR(10),obtener_id_habitacion INT,estado_habitacion VARCHAR(10))
BEGIN
SELECT * FROM reserva WHERE id_reserva = cancelar_id_reserva;
UPDATE reserva set estado = estado_reserva WHERE id_reserva = cancelar_id_reserva;
SELECT * FROM habitacion WHERE habitacion_id = obtener_id_habitacion;
UPDATE habitacion SET estado = estado_habitacion WHERE habitacion_id = obtener_id_habitacion;
END//
DELIMITER ;

CALL cancelar_reserva(8,"confirmada",2,"reservada");


