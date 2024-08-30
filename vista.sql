
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
SELECT ha.habitacion_id, ha.numero_habitacion, ha.estado, c.nombre_cliente, c.apellido_cliente, h.nombre_hotel
FROM Habitacion ha
INNER JOIN Reserva r ON ha.habitacion_id = r.habitacion_id
INNER JOIN Cliente c ON r.id_cliente = c.id_cliente
INNER JOIN Hotel h ON ha.id_hotel = h.id_hotel
WHERE ha.estado = "disponible";

SELECT * FROM habitaciones_disponibles

drop view habitaciones_disponibles

CREATE VIEW hotel_valoracion AS
SELECT nombre_hotel, categoria_estrellas AS "Estrellas"
FROM Hotel
ORDER BY categoria_estrellas DESC

