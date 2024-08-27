SELECT * FROM Hotel WHERE ubicacion LIKE 'Al%';

SELECT * FROM Hotel WHERE nombre_hotel LIKE '%Fiesta%'

SELECT h.nombre_hotel, COUNT(res.id_reserva) AS total_reservas
FROM Hotel h
JOIN Habitacion ha ON h.id_hotel = ha.id_hotel
JOIN Reserva res ON ha.habitacion_id = res.habitacion_id
GROUP BY h.nombre_hotel
ORDER BY total_reservas DESC LIMIT 1;

-- Consulta para obtener las reservas de un cliente (por email) realizadas en el mes anterior.
SELECT fecha_reserva, nombre_cliente, apellido_cliente, correo, id_reserva, habitacion_id, estado FROM Reserva r
Join Cliente c on r.id_cliente = c.id_cliente
where c.correo = "lauralopez@gmail.com"
AND MONTH(r.fecha_reserva) = MONTH(CURDATE()) - 1;

