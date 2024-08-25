CREATE DATABASE Proyecto_MySQL_Reservas
    DEFAULT CHARACTER SET = 'utf8mb4';

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(15) NOT NULL,
    apellido_cliente VARCHAR(20) NOT NULL,
    ced_id INT NOT NULL,
    correo VARCHAR(50),
    celular VARCHAR(15),
    id_pais INT NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES Pais (id_pais),
)

CREATE TABLE Reserva (
    id_reserva INT NOT NULL PRIMARY KEY,
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

CREATE TABLE Habitacion (
    habitacion_id INT NOT NULL PRIMARY KEY,
    id_hotel INT NOT NULL,
    numero_habitacion INT NOT NULL,
    tipo_habitacion VARCHAR(25),
    estado VARCHAR(15) NOT NULL,
    precio_noche INT NOT NULL,
    capacidad_maxima INT NOT NULL,
    Foreign Key (id_hotel) REFERENCES Hotel(id_hotel)
);

CREATE TABLE Hotel (
    id_hotel INT NOT NULL PRIMARY KEY,
    nombre_hotel VARCHAR(25) NOT NULL,
    cantidad_habitaciones INT NOT NULL,
    cantidad_personas INT NOT NULL,
    categoria_estrellas INT,
    ubicacion VARCHAR(50),
    descripcion VARCHAR(50),
    id_pais INT NOT NULL,
    Foreign Key (id_pais) REFERENCES Pais(id_pais)
);

CREATE TABLE Pais (
    id_pais INT PRIMARY KEY NOT NULL AUTO_INCREMENT,    
    nombre_pais VARCHAR(15) NOT NULL,
    pais_tel_codigo VARCHAR(20) NOT NULL,
)

INSERT INTO Cliente (nombre_cliente, apellido_cliente, ced_id, correo, celular)
VALUES 
("Laura", "Lopez", 123456789, "lauralopez@gmail.com", 8765-4321),
("Carlos", "Fernandez", 776543212, "carlosfernandez@gmail.com", 2456-7890),
("Sofia", "Rodriguez", 354764367, "sofiarodriguez@gmail.com", 6254-6975),
("Diego", "Martinez", 538511353, "dmartinez@gmail.com", 7245-6843),
("Daddy", "Yankee", 652348713, "digua@gmail.com", 6236-7534),
("Andrea", "Solano", 542672842, "andreasolano@gmail.com", 4312-5436),
("Andres", "Castillo", 463463278, "andres123@gmail.com", 6345-6273);

INSERT INTO Pais (nombre_pais, pais_tel_codigo)
VALUES 
("Costa Rica", "+506"),
("Mexico", "+52"),
("Colombia", "+57"),
("España", "+34"),
("USA", "+1"),
("Panamá", "+507"),
