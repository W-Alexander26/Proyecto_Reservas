CREATE DATABASE Proyecto_MySQL_Reservas
    DEFAULT CHARACTER SET = 'utf8mb4';
USE Proyecto_MySQL_Reservas;

CREATE TABLE Pais (
    id_pais INT PRIMARY KEY NOT NULL AUTO_INCREMENT,    
    nombre_pais VARCHAR(15) NOT NULL,
    pais_tel_codigo VARCHAR(20) NOT NULL
);
CREATE TABLE Hotel (
    id_hotel INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre_hotel VARCHAR(25) NOT NULL,
    cantidad_habitaciones INT NOT NULL,
    cantidad_personas INT NOT NULL,
    categoria_estrellas INT,
    ubicacion VARCHAR(50),
    descripcion VARCHAR(50),
    id_pais INT NOT NULL,
    Foreign Key (id_pais) REFERENCES Pais(id_pais)
);
CREATE TABLE Habitacion (
    habitacion_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_hotel INT NOT NULL,
    numero_habitacion INT NOT NULL,
    tipo_habitacion VARCHAR(25),
    estado VARCHAR(15) NOT NULL,
    precio_noche INT NOT NULL,
    capacidad_maxima INT NOT NULL,
    Foreign Key (id_hotel) REFERENCES Hotel(id_hotel)
);
CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(15) NOT NULL,
    apellido_cliente VARCHAR(20) NOT NULL,
    ced_id INT NOT NULL,
    correo VARCHAR(50),
    celular VARCHAR(15),
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES Pais(id_pais)
);
CREATE TABLE Reserva (
    id_reserva INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    cantidad_personas INT NOT NULL,
    check_in_date DATETIME NOT NULL,
    check_out_date DATETIME NOT NULL,
    tipo_de_pago VARCHAR(15),
    habitacion_id INT NOT NULL,
    fecha_reserva DATETIME NOT NULL,
    estado VARCHAR(15) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    Foreign Key (habitacion_id) REFERENCES Habitacion(habitacion_id)
);

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
CALL agregar_nueva_reserva (1, 3, '2024-08-26 07:00:00','2024-08-28 12:00:00', 'Tarjeta', 1, '2024-08-02 17:00:00', 'confirmada');

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




