CREATE INDEX opt_nombre_cliente ON Cliente (nombre_cliente) -- es comun que se realicen busquedas por nombre de cliente

CREATE INDEX opt_ubicacion ON Hotel(ubicacion) -- si el hotel tiene muchos registros el indice servirá para reducir el tiempo de busqueda

CREATE INDEX idx_fecha_reserva ON Reserva(fecha_reserva) -- este indice ayudara a poder encontrar las reservas hechas en fechas especificas mas rapidamente

