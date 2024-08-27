--Implementar un trigger que actualice automáticamente la disponibilidad de habitaciones
--cuando se realice una reserva o se cancele una existente.
DELIMITER//

CREATE TRIGGER disponibilidad_de_habitaciones
BEFORE UPDATE ON `reserva`
FOR EACH ROW
BEGIN
  IF NEW.estado = 'confirmada' THEN
    UPDATE habitacion SET estado = 'reservada' WHERE habitacion_id = NEW.habitacion_id;
  ELSEIF NEW.estado = 'cancelada' THEN
     UPDATE habitacion SET estado = 'disponible' WHERE habitacion_id= NEW.habitacion_id;
  END IF;
END 
DELIMITER ;