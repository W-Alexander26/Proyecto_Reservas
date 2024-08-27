CREATE INDEX opt_nombre_cliente ON Cliente (nombre_cliente) --es comun que se realicen busquedas por nombre de cliente

CREATE INDEX opt_ubicacion ON Hotel(ubicacion) --con la columna ubicacion si el hotel tiene bastantes registros el indice servirá para reducir el tiempo el busqueda

CREATE INDEX idx_id_reserva ON Reserva(id_reserva) 