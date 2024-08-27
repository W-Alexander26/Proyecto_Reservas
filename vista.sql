
CREATE VIEW reservas_del_dia AS
SELECT  
    id_cliente,
    fecha_reserva
FROM Reserva
WHERE DATE(fecha_reserva) = CURDATE()