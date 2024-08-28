--Consulta para contar cuántas habitaciones disponibles hay en un hotel específico en una
--fecha dada.
USE Proyecto_MySQL_Reservas;

SELECT h.nombre_hotel AS nombre_hotel, COUNT(ha.habitacion_id) AS habitaciones_disponibles
FROM hotel h
JOIN habitacion ha ON h.id_hotel = ha.id_hotel
LEFT JOIN reserva r ON ha.habitacion_id = r.habitacion_id AND r.check_in_date = '2024-07-01'
WHERE r.habitacion_id IS NULL
GROUP BY h.nombre_hotel;

--Consulta para calcular el promedio de reservas diarias en un hotel.
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

--Consulta para identificar el hotel con la mayor ocupación en el mes anterior.

WITH mayor_ocupacion_mes_anterior AS (
  SELECT 
    h.id_hotel,
    h.nombre_hotel AS nombre_hotel,
    COUNT(r.habitacion_id) AS reservas_mes_anterior
  FROM 
    hotel h
  JOIN 
    habitacion ha ON h.id_hotel = ha.id_hotel
  JOIN 
    reserva r ON ha.habitacion_id = r.habitacion_id
  WHERE 
    r.check_in_date >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH)
    AND r.check_in_date < CURRENT_DATE
  GROUP BY 
    h.id_hotel, h.nombre_hotel
)
SELECT 
  nombre_hotel,
  reservas_mes_anterior
FROM 
  mayor_ocupacion_mes_anterior
ORDER BY 
  reservas_mes_anterior DESC
LIMIT 1;


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