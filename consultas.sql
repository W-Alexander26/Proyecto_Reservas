USE Proyecto_MySQL_Reservas;
--------------------------------------------------------------------------------------------------------------------------------------
--Consulta para obtener los hoteles con mayor número de reservas.
SELECT h.nombre_hotel, COUNT(res.id_reserva) AS total_reservas
FROM Hotel h
JOIN Habitacion ha ON h.id_hotel = ha.id_hotel
JOIN Reserva res ON ha.habitacion_id = res.habitacion_id
GROUP BY h.nombre_hotel
ORDER BY total_reservas DESC LIMIT 1;
--------------------------------------------------------------------------------------------------------------------------------------

--Consulta para contar cuántas habitaciones disponibles hay en un hotel específico en una
--fecha dada.
SELECT h.nombre_hotel AS nombre_hotel, COUNT(ha.habitacion_id) AS habitaciones_disponibles
FROM hotel h
JOIN habitacion ha ON h.id_hotel = ha.id_hotel
LEFT JOIN reserva r ON ha.habitacion_id = r.habitacion_id AND r.check_in_date = '2024-07-01 00:00:00'
WHERE r.habitacion_id IS NULL
GROUP BY h.nombre_hotel;
----------------------------------------------------------------------------------------------------------------------------------------
--Consulta para buscar hoteles por nombre.
SELECT * FROM Hotel WHERE nombre_hotel LIKE '%Fiesta%'
-----------------------------------------------------------------------------------------------------------------------------------------
--Consulta para buscar hoteles cuya ubicación comienza con un texto específico.
SELECT * FROM Hotel WHERE ubicacion LIKE 'Al%';
------------------------------------------------------------------------------------------------------------------------------------------
--Consulta para buscar hoteles cuya ubicación termina con un texto específico.
SELECT * FROM Hotel WHERE ubicacion LIKE '%a';
------------------------------------------------------------------------------------------------------------------------------------------
-- Consulta para obtener las reservas de un cliente (por email) realizadas en el mes anterior.
SELECT fecha_reserva, nombre_cliente, apellido_cliente, correo, id_reserva, habitacion_id, estado FROM Reserva r
Join Cliente c on r.id_cliente = c.id_cliente
where c.correo = "lauralopez@gmail.com"
AND MONTH(r.fecha_reserva) = MONTH(CURDATE()) - 1;
-------------------------------------------------------------------------------------------------------------------------------------------
--Consulta para calcular el promedio de reservas diarias en un hotel.
SELECT 
  h.nombre_hotel AS nombre_hotel,
  AVG(reservas_diarias) AS promedio_reservas_diarias
FROM 
  hotel h
  JOIN (
    SELECT 
      r.id_hotel,
      DATE(r.check_in_date) AS fecha,
      COUNT(*) AS reservas_diarias
    FROM 
      reserva r
    GROUP BY 
      r.id_hotel, DATE(r.check_in_date)
  ) dr ON h.id_hotel = dr.id_hotel
GROUP BY 
  h.nombre_hotel;
--------------------------------------------------------------------------------------------------------------------------------------------
--Consulta para identificar el hotel con la mayor ocupación en el mes anterior.
SELECT 
  h.nombre_hotel AS nombre_hotel,
  AVG(reservas_diarias) AS promedio_reservas_diarias
FROM 
  hotel h
  JOIN (
    SELECT 
      r.id_reserva,
      DATE(r.check_in_date) AS fecha,
      COUNT(*) AS reservas_diarias
    FROM 
      reserva r
    GROUP BY 
      r.id_reserva, DATE(r.check_in_date)
  ) dr ON h.id_hotel = dr.id_reserva
GROUP BY 
  h.nombre_hotel;
---------------------------------------------------------------------------------------------------------------------------------------------
--Consulta para listar los hoteles que tienen habitaciones disponibles pero no han sido
--reservadas en el último mes.
SELECT 
  h.nombre_hotel AS nombre_hotel
FROM 
  hotel h
  JOIN habitacion ha ON h.id_hotel = ha.habitacion_id
WHERE 
  ha.habitacion_id NOT IN (
    SELECT 
      r.habitacion_id
    FROM 
      reserva r
    WHERE 
      r.check_in_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH)
      AND r.check_in_date < CURRENT_DATE
  )
  AND ha.estado = 'disponible';
------------------------------------------------------------------------------------------------------------------------------------------------
<<<<<<< HEAD
=======

>>>>>>> a066db3acf318aff8f508638805fb27a8bbe4975
