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
INSERT INTO Cliente (nombre_cliente, apellido_cliente, ced_id, correo, celular,id_pais)
VALUES 
("Laura", "Lopez", 123456789, "lauralopez@gmail.com", "8765-4321",1),
("Carlos", "Fernandez", 776543212, "carlosfernandez@gmail.com", "2456-7890",2),
("Sofia", "Rodriguez", 354764367, "sofiarodriguez@gmail.com", "6254-6975",3),
("Diego", "Martinez", 538511353, "dmartinez@gmail.com", "7245-6843",4),
("Daddy", "Yankee", 652348713, "digua@gmail.com", "6236-7534",5),
("Andrea", "Solano", 542672842, "andreasolano@gmail.com", "4312-5436",6);


INSERT INTO Pais (nombre_pais, pais_tel_codigo)
VALUES 
("Costa Rica", "+506"),
("Mexico", "+52"),
("Colombia", "+57"),
("España", "+34"),
("USA", "+1"),
("Panamá", "+507");

INSERT INTO Habitacion (id_hotel,numero_habitacion,tipo_habitacion,estado,precio_noche,capacidad_maxima) 
VALUES
(1,1,"familiar","disponible",80000,7),
(2,2,"individual","disponible",50000,2),
(3,3,"doble","disponible",65000,4),
(4,4,"suite","disponible",110000,6),
(5,5,"departamento","disponible",150000,5),
(6,6,"suite_presidencial","disponible",280000,5);


INSERT INTO Hotel (nombre_hotel,cantidad_habitaciones,cantidad_personas,categoria_estrellas,ubicacion,descripcion,id_pais)
VALUES 
("Hotel Montaña",60,210,4,"Monteverde","Hotel familiar de montaña",1),
("Hotel Belmar",80,520,5,"Monteverde","Hotel vacional familiar de montaña",2),
("Hotel Fiesta",150,800,3,"Puntarenas","Hotel playero familiar",3),
("Hotel Gran Casino",200,950,5,"Alajuela","Hotel lujoso y exclusivo",4),
("Hotel Croc´s",45,180,3,"Jacó","Hotel playero",5),
("Hotel San Andres",70,245,5,"Alajuela","Hotel lujoso y exclusivo",6);

INSERT INTO Reserva (id_cliente,cantidad_personas,check_in_date,check_out_date,tipo_de_pago,habitacion_id,fecha_reserva,estado)
VALUES 
(7,4,'2024-07-01 08:00:00','2024-07-05 12:00:00','Efectivo',1,'2024-06-27 12:00:00',"pendiente"),
(8,2,'2024-01-01 10:00:00','2024-01-07 12:00:00','Tarjeta',2,'2023-12-20 10:00:00',"cancelada"),
(9,4,'2024-02-09 08:30:00','2024-02-17 12:00:00','Tarjeta',3,'2024-01-10 16:00:00',"confirmada"),
(10,1,'2024-03-10 07:00:00','2024-03-15 12:00:00','Efectivo',4,'2024-03-05 13:00:00',"pendiente"),
(11,3,'2024-04-10 12:00:00','2024-04-17 12:00:00','Tarjeta',5,'2024-04-06 06:00:00',"cancelado"),
(12,4,'2024-06-01 12:00:00','2024-06-10 12:00:00','Efectivo',6,'2024-05-25 15:00:00',"confirmada");
