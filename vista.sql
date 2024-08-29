
CREATE VIEW reservas_del_dia AS
SELECT  
    id_cliente,
    fecha_reserva
FROM Reserva
WHERE DATE(fecha_reserva) = CURDATE()

CREATE VIEW reservas_recientes AS
SELECT id_reserva, fecha_reserva
FROM Reserva
ORDER BY fecha_reserva DESC

SELECT * FROM reservas_recientes

CREATE VIEW habitaciones_disponibles AS
SELECT habitacion_id, numero_habitacion, estado, nombre_cliente, apellido_cliente, nombre_hotel
FROM Habitacion 
INNER join Cliente on id_cliente = habitacion_id
INNER join Hotel on `Habitacion`.id_hotel = `Hotel`.id_hotel
WHERE estado = "disponible"

SELECT * FROM habitaciones_disponibles

CREATE VIEW hotel_valoracion AS
SELECT nombre_hotel, categoria_estrellas AS "Estrellas"
FROM Hotel
ORDER BY categoria_estrellas DESC

