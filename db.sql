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

